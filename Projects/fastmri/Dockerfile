FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime

# run shell.sh
COPY ./setup/shell.sh ./shell.sh
RUN sh shell.sh
RUN rm shell.sh

# install requirements
COPY ./burning_gpu/requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
RUN rm requirements.txt

# set up repository
RUN mkdir -p /root/burning_gpu
WORKDIR /root/burning_gpu
RUN git init
RUN git remote add origin https://github.com/slowGPU/burning_gpu.git

# run ssh
EXPOSE 22
RUN service ssh start
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# open port for mlflow
EXPOSE 5000

# copy setup.sh
COPY ./Projects/fastmri/setup.sh /root/setup.sh

# shell as zsh
CMD ["/bin/zsh"]
