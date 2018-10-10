FROM jeandet/meson-test-projects-corpus-fedora-image

COPY build.xsh /build.xsh
COPY projects.yml /projects.yml

RUN chmod +x /build.xsh && \
    pip3 install git+https://github.com/mesonbuild/meson && \
    /build.xsh 