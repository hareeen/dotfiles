FROM archlinux:latest

ENV container "docker"
RUN pacman -Syu --noconfirm; \
    yes | pacman -Scc; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /lib/systemd/system/graphical.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# set up machine
COPY ./common/setup_shell.sh ./setup_shell.sh
RUN sh setup_shell.sh
RUN rm setup_shell.sh

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]
