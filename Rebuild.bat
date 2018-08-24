dos2unix startup.sh
dos2unix supervisor_kohl.conf
docker build --no-cache -t oliverkohldsc/ubuntu-headless-desktop-vnc .
rem docker build --no-cache -t ubuntu-headless-desktop-vnc .
pause