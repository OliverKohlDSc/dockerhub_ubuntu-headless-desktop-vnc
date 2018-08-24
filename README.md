# What is it?

This is the code repository fro an ubuntu container with a "headless" VNC session, SSH, LXQT and preinstalled Firefox and Chrome browser

The useable docker image can be found here: https://hub.docker.com/r/oliverkohldsc/ubuntu-headless-desktop-vnc/

Just type the following into your docker environment

`docker pull oliverkohldsc/ubuntu-headless-desktop-vnc`

or if you have a comfortable GUI or webenvironment, you can just specify the repository and image name by entering:

`oliverkohldsc/ubuntu-headless-desktop-vnc`

Enjoy! :smiley:

# Features and Details

The headless VNC image is installed with the following components:

 * Desktop environment Xfce4 or IceWM
 * VNC-Server (default VNC port 5901)
 * SSH (default SSH port 22)
 * Browsers:
   * Mozilla Firefox
   * Chromium

# Quick start - About VNC

Forward the default VNC service port **5900** to host by

`docker run -p 5900:5900 oliverkohldsc/ubuntu-headless-desktop-vnc`

Now, open your favorite vnc viewer and connect to port 5900. If you would like to protect vnc service by password, set environment variable **VNC_PASSWORD**, e.g.

`docker run -p 5900:5900 -e VNC_PASSWORD=mypassword oliverkohldsc/ubuntu-headless-desktop-vnc`

A prompt will ask password either in the browser or vnc viewer.


# Screen Resolution

The Resolution of virtual desktop adapts browser window size when first connecting the server. You may choose a fixed resolution by passing **RESOLUTION** environment variable, for example

`docker run -p 5900:5900 -e RESOLUTION=1920x1080 oliverkohldsc/ubuntu-headless-desktop-vnc`

# Default Desktop User

The default user is root with the password "*ubuntu*". You may change the user and password respectively by **USER** and **PASSWORD** environment variable, for example,

`docker run -p 5900:5900 -e USER=oliver -e PASSWORD=mypassword oliverkohldsc/ubuntu-headless-desktop-vnc`

# Sound (ATTENTION)

> :exclamation: ATTENTION: It works in Linux only! :exclamation:

First of all, insert kernel module snd-aloop and specify 2 as the index of sound loop device

`sudo modprobe snd-aloop index=2`

Start the container

`docker run -it --rm -p 5900:5900 --device /dev/snd -e ALSADEV=hw:2,0 oliverkohldsc/ubuntu-headless-desktop-vnc`

where `--device /dev/snd -e ALSADEV=hw:2,0` means to grant sound device to container and set basic ASLA config to use card 2.

Connect with your VNC viewer to 127.0.0.1:5900. Now you can start Chromium in start menu (Internet -> Chromium Web Browser Sound) and try to play a video.
