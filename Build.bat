dos2unix startup.sh
dos2unix supervisor_kohl.conf
docker build -t oliverkohldsc/ubuntu-headless-desktop-vnc .
rem docker build -t ubuntu-headless-desktop-vnc .
pause