FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime

# set up machine
COPY ./common/setup_shell.sh ./setup_shell.sh
RUN sh setup_shell.sh
RUN rm setup_shell.sh

# Manipulate PATH
RUN echo "export PATH=$PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /root/.zshrc

# shell as fish
CMD ["/usr/local/bin/fish"]
