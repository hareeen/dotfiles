FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

# set up machine
COPY ./common/setup_shell.sh ./setup_shell.sh
RUN sh setup_shell.sh
RUN rm setup_shell.sh

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# shell as fish
CMD ["/usr/local/bin/fish"]
