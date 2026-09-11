FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update --fix-missing && apt-get -y upgrade && \
    ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone && \
    apt-get install -y binfmt-support qemu-user-static gcc-10-aarch64-linux-gnu kernel-package fakeroot simg2img img2simg mkbootimg bison && \
    apt-get install -y debootstrap build-essential fakeroot bc kmod cpio flex cpio libncurses5-dev libelf-dev libssl-dev && \
    apt-get install -y build-essential git flex gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu libssl-dev rsync

########################
## KERNEL

RUN git clone https://github.com/OpenStick/linux --depth=1 && cd ./linux && git checkout f17addf14f0ab2ef17e314249e0cfeb3fd7bcc9a

########################

VOLUME [ "/config", "/output", "/rootfs" ]
