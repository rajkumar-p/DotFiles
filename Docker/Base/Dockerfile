# Base Image - Ubuntu
FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

# Set TERM
ENV TERM=xterm

# Upgrade/update packages
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install sudo -y
RUN apt-get install apt-utils -y

# Create new user - raj/raj and add it to sudoers
RUN useradd -m raj
RUN echo raj:raj | chpasswd
# RUN adduser raj sudo
RUN usermod -aG sudo raj
# RUN mkdir /home/raj
RUN chown raj:raj /home/raj/

# Install dev tools to build binaries
RUN apt-get install build-essential -y

# Install GDB
RUN apt-get install gdb -y

# Install git
RUN apt-get install git -y

# Install patched fonts - For zsh + neovim
RUN apt-get install fonts-powerline -y

# Install zsh
RUN apt-get install zsh -y

# Install cURL
RUN apt-get install curl -y

# Install wget
RUN apt-get install wget -y

# Install python3.8
RUN apt-get install python3.8 python3.8-dev python3.8-distutils python3.8-venv -y

# Install pip3
RUN apt-get install python3-pip -y

# Install nodejs
RUN apt-get install nodejs -y

# Install npm
RUN apt-get install npm -y

# Install man pages for development tools
RUN apt-get install manpages-dev -y

# Install pkg-config
RUN apt-get install pkg-config -y

# Install language/diagnostic servers
RUN apt-get install ccls -y
RUN pip install python-language-server
RUN npm install -g diagnostic-languageserver

# Install neovim
WORKDIR /usr/src
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage
RUN /usr/src/nvim.appimage --appimage-extract
RUN mv squashfs-root /
RUN ln -s /squashfs-root/AppRun /usr/bin/nvim

# Set user
USER raj
WORKDIR /home/raj
ENV USER=raj

# # zsh settings
# RUN echo "HISTFILE=~/.histfile" >> /home/raj/.zshrc
# RUN echo "HISTSIZE=1000" >> /home/raj/.zshrc
# RUN echo "SAVEHIST=1000" >> /home/raj/.zshrc
# RUN echo "bindkey -v" >> /home/raj/.zshrc

# Install oh-my-zsh
RUN mkdir /home/raj/tmp
WORKDIR /home/raj/tmp
RUN wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O omz-install.sh
RUN chmod u+x omz-install.sh
RUN ./omz-install.sh

WORKDIR /home/raj

# Install zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh settings
RUN echo "export ZSH=\"$HOME/.oh-my-zsh\"" > /home/raj/.zshrc
RUN echo "ZSH_THEME=\"robbyrussell\"" >> /home/raj/.zshrc
RUN echo "plugins=(git zsh-autosuggestions)" >> /home/raj/.zshrc
RUN echo "source \$ZSH/oh-my-zsh.sh" >> /home/raj/.zshrc

# Create .config directory
RUN mkdir ~/.config

# Setup nvim
RUN git clone https://github.com/rajkumar-p/DotFiles.git
RUN ln -s /home/raj/DotFiles/nvim /home/raj/.config/nvim
RUN curl -fLo /home/raj/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +qa
