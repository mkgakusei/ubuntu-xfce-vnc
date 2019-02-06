# mk (c) 2019
FROM consol/ubuntu-xfce-vnc

# Fix ability to become superuser
USER 0
RUN apt-get update && apt-get install sudo \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -u 1000 -M ubuntu \
    && usermod ubuntu -a -G sudo
RUN bash -c "echo -e 'ubuntu\nubuntu' | passwd -q ubuntu"
USER 1000
