################################################################################
# base system
################################################################################
FROM ubuntu:18.04 as system

ARG localbuild
RUN if [ "x$localbuild" != "x" ]; then sed -i 's#http://archive.ubuntu.com/#http://tw.archive.ubuntu.com/#' /etc/apt/sources.list; fi

# General unneeded stuff
# apt-get --no-install-recommends --ignore-missing -o Dpkg::Options::='--ignore-depends=...' install ...
# apt-cache showpkg gir1.2-mutter-2
# apt-get install gnome-shell-common=3.28.1-0ubuntu2 libmutter-2-0:3.28.3.1
# env XDG_CURRENT_DESKTOP=GNOME gnome-control-center

# Install Gnome 3
# It seems that the Gnome 3 installation is not straight forward due to dependency issues.
# Alternatively we could install Ubuntu's modified Gnome 3 Vanilla, by using "tasksel install ubuntu-desktop"
# https://launchpad.net/ubuntu/bionic/+source/mutter
# https://launchpad.net/ubuntu/+source/mutter/3.28.3-1~ubuntu18.04.1
# https://launchpad.net/ubuntu/+source/mutter/3.28.3-1~ubuntu18.04.1/+build/15220546
# https://launchpad.net/ubuntu/bionic/amd64/libmutter-2-0/3.28.3-1~ubuntu18.04.1
# https://launchpad.net/ubuntu/bionic/amd64/mutter-common/3.28.3-1~ubuntu18.04.1
#RUN export DEBIAN_FRONTEND="noninteractive" && apt-get update \
#    && apt-get install -y --no-install-recommends curl dialog software-properties-common wget apt-utils \
#    && apt-get update \
#    && apt-get install -y --no-install-recommends --allow-unauthenticated \
#        supervisor sudo vim net-tools zenity xz-utils \
#        dbus-x11 x11-utils alsa-utils \
#        mesa-utils libgl1-mesa-dri \
#        xvfb x11vnc \
#        gtk2-engines-murrine gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine arc-theme \
#        firefox chromium-browser \
#        ttf-ubuntu-font-family ttf-wqy-zenhei \
#        libcanberra-gtk3-0 libcanberra0 libgnome-desktop-3-17 libinput10 libupower-glib3 libwacom2 \
#        libxcb-randr0 libxcb-res0 libxkbcommon-x11-0 gir1.2-atk-1.0 gir1.2-freedesktop \
#        gir1.2-gdesktopenums-3.0 gir1.2-gtk-3.0 gir1.2-json-1.0 gir1.2-pango-1.0 \
#    && add-apt-repository -r ppa:gnome3-team/gnome3 -y \
#    && apt-get autoclean \
#    && apt-get autoremove \
#    && rm -rf /var/lib/apt/lists/* \
#    && apt-get update \
#    && wget -q https://launchpad.net/ubuntu/+source/mutter/3.28.3-1~ubuntu18.04.1/+build/15220546/+files/gir1.2-mutter-2_3.28.3-1~ubuntu18.04.1_amd64.deb http://launchpadlibrarian.net/381314426/libmutter-2-0_3.28.3-1~ubuntu18.04.1_amd64.deb http://launchpadlibrarian.net/381314424/mutter-common_3.28.3-1~ubuntu18.04.1_all.deb \
#    && yes | dpkg -i libmutter-2-0_3.28.3-1~ubuntu18.04.1_amd64.deb mutter-common_3.28.3-1~ubuntu18.04.1_all.deb gir1.2-mutter-2_3.28.3-1~ubuntu18.04.1_amd64.deb \
#    && rm -rf *.deb \
#    && apt-get -y --allow-unauthenticated install gnome-shell ubuntu-gnome-desktop gnome-session 

# Install Cinnamon
#RUN export DEBIAN_FRONTEND="noninteractive" && apt-get update \
#    && apt-get install -y --no-install-recommends curl dialog software-properties-common wget apt-utils \
#    && apt-get update \
#    && apt-get install -y --no-install-recommends --allow-unauthenticated \
#        supervisor sudo vim net-tools zenity xz-utils \
#        dbus-x11 x11-utils alsa-utils \
#        mesa-utils libgl1-mesa-dri \
#        xvfb x11vnc \
#        gtk2-engines-murrine gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine arc-theme \
#        firefox chromium-browser \
#        ttf-ubuntu-font-family ttf-wqy-zenhei \
#        cinnamon \
#    && apt-get autoclean \
#    && apt-get autoremove \
#    && rm -rf /var/lib/apt/lists/* \
#    && apt-get update

# Install MATE
#RUN export DEBIAN_FRONTEND="noninteractive" && apt-get update \
#    && apt-get install -y --no-install-recommends curl dialog software-properties-common wget apt-utils \
#    && apt-get update \
#    && apt-get install -y --no-install-recommends --allow-unauthenticated \
#        supervisor sudo vim net-tools zenity xz-utils \
#        dbus-x11 x11-utils alsa-utils \
#        mesa-utils libgl1-mesa-dri \
#        xvfb x11vnc \
#        gtk2-engines-murrine gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine arc-theme \
#        firefox chromium-browser \
#        ttf-ubuntu-font-family ttf-wqy-zenhei \
#        mate ubuntu-mate-themes ubuntu-mate-desktop \
#    && apt-get autoclean \
#    && apt-get autoremove \
#    && rm -rf /var/lib/apt/lists/* \
#    && apt-get update
 
# Install LXDE
#RUN export DEBIAN_FRONTEND="noninteractive" && apt-get update \
#    && apt-get install -y --no-install-recommends curl dialog software-properties-common wget apt-utils \
#    && apt-get update \
#    && apt-get install -y --no-install-recommends --allow-unauthenticated \
#        supervisor sudo vim net-tools zenity xz-utils \
#        dbus-x11 x11-utils alsa-utils \
#        mesa-utils libgl1-mesa-dri \
#        xvfb x11vnc \
#        gtk2-engines-murrine gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine arc-theme \
#        firefox chromium-browser \
#        ttf-ubuntu-font-family ttf-wqy-zenhei \
#        lxde \
#    && apt-get autoclean \
#    && apt-get autoremove \
#    && rm -rf /var/lib/apt/lists/* \
#    && apt-get update

# Install lxqt
RUN export DEBIAN_FRONTEND="noninteractive" && apt-get update \
    && apt-get install -y --no-install-recommends curl dialog software-properties-common wget apt-utils aptitude \
    && apt-get update \
    && apt-get install -y --no-install-recommends --allow-unauthenticated \
        supervisor sudo vim net-tools zenity xz-utils \
        dbus-x11 x11-utils alsa-utils \
        mesa-utils libgl1-mesa-dri \
        xvfb x11vnc \
        firefox chromium-browser \
        ttf-ubuntu-font-family ttf-wqy-zenhei \
    && apt-get install -y lxqt openbox \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update

# Install lxqt_wallet
RUN export DEBIAN_FRONTEND="noninteractive"  && apt-get install -y --no-install-recommends unzip \
    && wget -q https://codeload.github.com/mhogomchungu/lxqt_wallet/zip/master -O lxqt-wallet.zip \
    && unzip lxqt-wallet.zip \
    && cd lxqt_wallet-master \
    && echo 'Downloading required dependencies for lxqt_wallet' \
    && apt-get -y --allow-unauthenticated install libgcrypt20-dev qttools5-dev libsecret-1-dev qtbase5-dev cmake gcc g++ binutils make \
    && apt-get -y --allow-unauthenticated install qt5-default qttools5-dev-tools \
    && echo 'Starting build of lxqt_wallet' \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr -Wno-deprecated -DNOKDESUPPORT=false -DNOSECRETSUPPORT=false -DCMAKE_BUILD_TYPE=RELEASE .. \
    && make \
    && make install \
    && echo 'Cleanup dev tools and source files from lxqt_wallet' \
    && cd ../.. \
    && rm -rf lxqt*walle* \
    && apt-get purge --yes --allow-downgrades --allow-change-held-packages libgcrypt20-dev qttools5-dev libsecret-1-dev qtbase5-dev cmake gcc g++ binutils make \
    && apt-get autoclean --yes \
    && apt-get autoremove --yes --allow-downgrades --allow-change-held-packages \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update

RUN  export DEBIAN_FRONTEND="noninteractive" && apt-get -y install openssh-server obconf && mkdir /run/sshd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# kill `ps -e | grep sshd | grep -v grep | awk '{print $1}'`

RUN update-alternatives --display x-window-manager

RUN export DEBIAN_FRONTEND="noninteractive" && apt-get install -y --allow-unauthenticated thunderbird

# tini for subreap                                   
ARG TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

# ffmpeg
RUN mkdir -p /usr/local/ffmpeg \
    && curl -sSL https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz | tar xJvf - -C /usr/local/ffmpeg/ --strip 1

RUN  mkdir /Wallpapers
COPY Wallpapers/*.jpg /Wallpapers/
COPY Wallpapers/*.png /Wallpapers/

COPY startup.sh /startup.sh
COPY supervisor_kohl.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x startup.sh

################################################################################
# merge
################################################################################
FROM system
LABEL maintainer="oliver@kohl.bz"

EXPOSE 80
WORKDIR /root
ENV HOME=/home/ubuntu \
    SHELL=/bin/bash
#HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://127.0.0.1/api/health
ENTRYPOINT ["/startup.sh"]
