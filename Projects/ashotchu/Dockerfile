FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime

# set up machine
COPY ./scripts/setup_machine.sh ./setup_machine.sh
RUN sh setup_machine.sh
RUN rm setup_machine.sh

# install requirements
COPY ./AShotChu/requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
RUN rm requirements.txt

# install deps
RUN apt update
RUN apt install -y s3fs libgl1-mesa-glx tar

# set up repository
RUN mkdir -p /root/AShotChu
WORKDIR /root/AShotChu
RUN git init
RUN git branch -M main
RUN git remote add origin https://github.com/Smoooth-Brain/AShotChu.git

RUN git clone https://github.com/chengtan9907/OpenSTL.git

# download data
COPY ./Projects/ashotchu/mmnist.sh ./mmnist.sh
RUN sh mmnist.sh
RUN rm mmnist.sh

# configure ssh
EXPOSE 22
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN service ssh enable

# open port for mlflow
EXPOSE 5000

# Manipulate PATH
RUN echo "export PATH=$PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /root/.zshrc

# shell as zsh
CMD ["/bin/zsh"]
