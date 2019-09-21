FROM archlinux/base:latest

RUN pacman -Syu --noconfirm base-devel git && \
    useradd -m user && \
    pacman -Syu --noconfirm sudo && \
    echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    sudo -u user -i bash -c "git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm" && \
    sudo -u user -i bash -c "tar xf ~/yay/*xz"

# docker cp DOCKER_CONTAINER:/home/user/usr/bin/yay .

