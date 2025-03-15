FROM quay.io/fedora/fedora-bootc:41

ENV REMOVE_RPM="gnome-tour gnome-abrt gnome-calculator gnome-calendar gnome-maps gnome-weather \
    rhythmbox gnome-contacts totem gnome-logs gnome-photos gnome-clocks gedit gnome-system-monitor \
    gnome-user-docs gnome-screenshot gnome-remote-desktop"

ENV INSTALL_RPM="steam gamescope goverlay gamemode  git bash-completion zram-generator podman-bootc \
    sway swaync waybar swayidle swaybg wofi @GNOME gnome-polkit"

ENV SYS_FLATPAK="app.zen_browser.zen"

ENV USER_FLATPAK="com.discordapp.Discord dev.zed.Zed"

COPY etc etc

RUN dnf install -y  $INSTALL_RPM && \
    dnf remove -y $REMOVE_RPM && \
    dnf clean all && \
    flatpak install --system $SYS_FLATPAK && \
    flatpak install --user $USER_FLATPAK && \
    bootc container lint


#COPY [unpackaged application]
#COPY [configuration files]
#RUN [config scripts]
