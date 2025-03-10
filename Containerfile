FROM quay.io/fedora/fedora-bootc:41
# RUN dnf install -y [system agents] [dependencies] && dnf clean all
# COPY [unpackaged application]
# COPY [configuration files]
# RUN [config scripts]
COPY etc etc
#COPY usr usr

RUN dnf remove gnome-tour gnome-abrt gnome-calculator gnome-calendar gnome-maps gnome-weather \
    rhythmbox gnome-contacts totem gnome-logs gnome-photos gnome-clocks gedit gnome-system-monitor \
    gnome-user-docs gnome-screenshot gnome-remote-desktop

RUN dnf install -y steam gamescope goverlay gamemode  git bash-completion zram-generator podman-machine \
    sway swaync waybar swayidle swaybg wofi polkit && \
    dnf clean all

RUN flatpak install --system app.zen_browser.zen && \
    flatpak install --user com.discordapp.Discord dev.zed.Zed  && \

RUN bootc container lint


#COPY [unpackaged application]
#COPY [configuration files]
#RUN [config scripts]
