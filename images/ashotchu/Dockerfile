FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime

# set up machine
COPY ./common/setup_shell.sh ./setup_shell.sh
RUN sh setup_shell.sh
RUN rm setup_shell.sh

# install requirements
COPY ./AShotChu/requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
RUN rm requirements.txt

# install deps
RUN apt update
RUN apt install -y libgl1-mesa-glx tar unzip

# install ruff
RUN curl -LsSf https://astral.sh/ruff/install.sh | sh

# set up repository
RUN mkdir -p /root/AShotChu
WORKDIR /root/AShotChu
RUN git init
RUN git branch -M main
RUN git remote add origin https://github.com/Smoooth-Brain/AShotChu.git

RUN git clone https://github.com/chengtan9907/OpenSTL.git

# run prebuild script
COPY ./images/ashotchu/prebuild prebuild
RUN find prebuild -type f -name "*.sh" -exec sh {} \;
RUN rm -rf prebuild

# copy postbuild script
COPY ./images/ashotchu/postbuild postbuild

# configure ssh
EXPOSE 22
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# open port for mlflow
EXPOSE 5000

# Manipulate PATH
RUN echo "export PATH=$PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /root/.zshrc

# shell as zsh
CMD ["/bin/zsh"]
