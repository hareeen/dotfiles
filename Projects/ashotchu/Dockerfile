FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime

# run shell.sh
COPY ./setup/shell.sh ./shell.sh
RUN sh shell.sh
RUN rm shell.sh

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

# run ssh
EXPOSE 22
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN service ssh start

# open port for mlflow
EXPOSE 5000

# copy setup.sh
# COPY ./Projects/fastmri/setup.sh /root/setup.sh

# shell as zsh
CMD ["/bin/zsh"]
