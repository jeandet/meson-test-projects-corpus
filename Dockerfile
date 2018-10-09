FROM fedora:28

COPY build.xsh /build.xsh

RUN dnf install -y git cmake ninja-build tar gzip unzip ninja-build xonsh python3-pip
RUN chmod +x /build.xsh && \
    pip3 install git+https://github.com/mesonbuild/meson && \
    /build.xsh 