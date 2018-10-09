FROM fedora:28

RUN dnf install -y git cmake meson tar gzip unzip ninja-build xonsh

RUN build.xsh