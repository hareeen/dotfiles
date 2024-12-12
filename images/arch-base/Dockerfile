FROM archlinux:latest

# set up machine
COPY ./common/setup_shell.sh ./setup_shell.sh
RUN sh setup_shell.sh
RUN rm setup_shell.sh

# shell as fish
CMD ["/usr/local/bin/fish"]
