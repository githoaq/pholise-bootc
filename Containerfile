FROM quay.io/fedora/fedora-bootc:41
# RUN dnf install -y [system agents] [dependencies] && dnf clean all
# COPY [unpackaged application]
# COPY [configuration files]
# RUN [config scripts]
COPY etc etc
#COPY usr usr

# Setup repos
RUN dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install pkgs
RUN dnf remove -y gnome-tour gnome-abrt gnome-calculator gnome-calendar gnome-maps gnome-weather \
    rhythmbox gnome-contacts totem gnome-logs gnome-photos gnome-clocks gedit gnome-system-monitor \
    gnome-user-docs gnome-screenshot gnome-remote-desktop

RUN dnf install -y steam gamescope goverlay gamemode  git bash-completion zram-generator podman-machine \
    sway swaync waybar swayidle swaybg wofi xfce-polkit flatpak && \
    dnf clean all

# Setup flatpak
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
    flatpak install -y --system app.zen_browser.zen com.discordapp.Discord dev.zed.Zed && \
    #flatpak install -y --user com.discordapp.Discord dev.zed.Zed  && \
    bootc container lint 


#COPY [unpackaged application]
#COPY [configuration files]
#RUN [config scripts]
