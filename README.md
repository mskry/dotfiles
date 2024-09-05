# Setting Up Development Environment for Arch Linux

## Install Essential Packages

1. Install core utilities and development tools

```bash
pacman -S gcc make unzip fish alacritty neovim starship xclip stow git git-delta base-devel ripgrep fd fzf bottom bat eza procs dust sd nitrogen docker 
```

2. Install yay the _Arch User Repository_ helper

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

3. Install a beautiful nerd font for your terminal

```bash
yay -S ttf-jetbrains-mono-nerd
fc-cache -vf
```

4. Manage Node.js with Volta

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

```bash
docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

```bash
docker run -d -p 3000:8080 --gpus all --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:cuda
```

4. Run a model (codegemma ❤️)

```bash
docker exec -it ollama ollama run codegemma:instruct
```

5. Move Docker root directory (optional):

```bash
# Stop Docker services
sudo systemctl stop docker  docker.socket containerd
# Create a new directory (replace `/home/user/new_dir` with your desired location) 
sudo mkdir -p /home/user/new_dir
sudo mv /var/lib/docker /home/user/new_dir
```

6.  Configure Docker data-root  in`daemon.json`:

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

7. Validate new Docker root location

```bash
docker info -f '{{ .DockerRootDir}}'
```

8. Restart Docker services for the changes to take effect:

```bash
sudo systemctl restart docker docker.socket containerd
```


9. Integrating `openedai-speech` TTS into Open WebUI

```bash
# expose it throught host.docker.internal:8000 so Open WebUI can access it
docker run -d --gpus=all -p 8000:8000 --add-host=host.docker.internal:host-gateway -v tts-voices:/app/voices -v tts-config:/app/config --name openedai-speech ghcr.io/matatonic/openedai-speech:latest
```


10. Open the Open WebUI settings and navigate to the TTS Settings under **Admin Panel > Settings > Audio**.
    - Text-to-Speech Engine: OpenAI
    - API Base URL: `http://host.docker.internal:8000/v1`
    - API Key: `anykey` (note: this is a dummy API key, as `openedai-speech` doesn't require an API key;  you can use whatever for this field)


![[https://github.com/mskry/dotfiles/blob/master/img.png]]
