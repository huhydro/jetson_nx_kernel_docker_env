FROM scratch

ADD ubuntu-bionic-oci-amd64-root.tar.gz /

RUN apt update && apt install -y openssh-server sudo vim build-essential iputils-ping gcc-aarch64-linux-gnu libncurses-dev bc python python3
RUN useradd -rm -d /home/dev -s /bin/bash -g root -G sudo -u 1001  dev
RUN echo 'dev:dev' | chpasswd
RUN service ssh start
EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
