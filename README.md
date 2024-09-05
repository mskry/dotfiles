# Setting Up Development Environment for Arch Linux

## Install Essential Packages

1. Install core utilities and development tools:

```bash
pacman -S gcc make man-db unzip fish alacritty neovim starship xclip stow git git-delta base-devel ripgrep fd fzf bottom bat eza procs dust sd nitrogen docker 
```

2. Install yay the _Arch User Repository_ helper:

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

3. Install the necessary fonts for the system and terminal, including regular, nerd, and emoji fonts:

```bash
yay -S --noconfirm ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji
# if you need chinese/japanese/korean support: yay -S noto-fonts-cjk
fc-cache -vf
```

4. Manage Node.js with Volta. Very fast and seamless per-project version switching:

```bash
curl https://get.volta.sh | bash
volta install node pnpm
```

## Setting up Docker and Ollama

1. Avoid `sudo` for Docker commands:

```bash
sudo usermod -aG docker $USER
```

2. Install NVIDIA Container Toolkit (if applicable):

```bash
yay -S nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```

3. Run Ollama inside a Docker container with Open WebUI

- Run Ollama container

```bash
docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

- Check if Ollama is up and running

```bash
curl -i http://localhost:11434/
```

```
HTTP/1.1 200 OK
Content-Type: text/plain; charset=utf-8
Date: Thu, 05 Sep 2024 14:04:02 GMT
Content-Length: 17

Ollama is running
```

- Run Open WebUI container

    The `--add-host=host.docker.internal:host-gateway` flag enables communication between containers using the host's IP address. Will need it to communicate with TTS service later.

```bash
docker run -d -p 3000:8080 --gpus all --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:cuda
```

- Open the WebUI

   `http://localhost:3000/`

4. Run a model (codegemma ❤️)

    CodeGemma is a collection of powerful, lightweight models that can perform a variety of coding tasks like fill-in-the-middle code completion, code generation, natural language understanding, mathematical reasoning, and instruction following.

      - `instruct` a 7b instruction-tuned variant for natural language-to-code chat and instruction following  
      - `code` a 7b pretrained variant that specializes in code completion and generation from code prefixes and/or suffixes  
      - `2b` a state of the art 2B pretrained variant that provides up to 2x faster code completion

```bash
docker exec -it ollama ollama run codegemma:instruct
```

5. Move Docker root directory (optional):
   You might want to move Docker root to a different volume to save the system disk space

   In this example I moved Docker root directory to the `/home`, in my case it is mounted to a separate volume:

```bash
# Stop Docker services
sudo systemctl stop docker  docker.socket containerd
# Create a new directory (replace `/home/user/new_dir` with your desired location) 
sudo mkdir -p /home/user/new_dir
sudo mv /var/lib/docker /home/user/new_dir
```

- Configure Docker root  in`daemon.json`:

```bash
sudo vim /etc/docker/daemon.json
```

```json
{
   "data-root": "/home/user/new_dir",
   "runtimes": {
      "nvidia": {
         "args": [],
         "path": "nvidia-container-runtime"
      }
    }
}
```

- Validate new Docker root location:

```bash
docker info -f '{{ .DockerRootDir}}'
```

- Restart Docker services for the changes to take effect:

```bash
sudo systemctl restart docker docker.socket containerd
```

6. Integrating `openedai-speech` TTS into Open WebUI

```bash
# expose it throught host.docker.internal:8000 so Open WebUI can access it
docker run -d --gpus=all -p 8000:8000 --add-host=host.docker.internal:host-gateway -v tts-voices:/app/voices -v tts-config:/app/config --name openedai-speech ghcr.io/matatonic/openedai-speech:latest
```

- Open the Open WebUI settings and navigate to the TTS Settings under **Admin Panel > Settings > Audio**.

   Text-to-Speech Engine: OpenAI
   API Base URL: `http://host.docker.internal:8000/v1`
   API Key: `anykey` (note: this is a dummy API key, as `openedai-speech` doesn't require an API key;  you can use whatever for this field)

![open web ui tts settings](https://github.com/mskry/dotfiles/blob/master/img.png?raw=true)
