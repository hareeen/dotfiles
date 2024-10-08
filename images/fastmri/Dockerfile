FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime

# set up machine
COPY ./common/setup_shell.sh ./setup_shell.sh
RUN sh setup_shell.sh
RUN rm setup_shell.sh

# install requirements
COPY ./burning_gpu/requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
RUN rm requirements.txt

# install cv2 lib
RUN apt update
RUN apt install -y s3fs libgl1-mesa-glx

# install ruff
RUN curl -LsSf https://astral.sh/ruff/install.sh | sh

# set up repository
RUN mkdir -p /root/burning_gpu
WORKDIR /root/burning_gpu
RUN git init
RUN git branch -M main
RUN git remote add origin https://github.com/slowGPU/burning_gpu.git

# configure ssh
EXPOSE 22
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# open port for mlflow
EXPOSE 5000

# copy setup.sh
COPY ./images/fastmri/setup.sh /root/setup.sh

# Manipulate PATH
RUN echo "export PATH=$PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /root/.zshrc

# shell as zsh
CMD ["/bin/zsh"]
