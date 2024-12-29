FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

# set up machine
COPY ./common/setup_shell.sh ./setup_shell.sh
RUN sh setup_shell.sh
RUN rm setup_shell.sh

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# add cargo bin to path
RUN echo "set -gx PATH /root/.cargo/bin \$PATH" >> /root/.config/fish/config.fish

# add cuda to path
RUN echo "set -gx PATH /usr/local/cuda/bin \$PATH" >> /root/.config/fish/config.fish
RUN echo "set -gx LD_LIBRARY_PATH /usr/local/cuda/lib64 \$LD_LIBRARY_PATH" >> /root/.config/fish/config.fish

# shell as fish
CMD ["/usr/local/bin/fish"]
