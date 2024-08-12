FROM quay.io/vessl-ai/torch:2.3.1-cuda12.1

# run shell.sh
COPY ./setup/shell.sh ./shell.sh
RUN sh shell.sh
RUN rm shell.sh

# install requirements
COPY ./burning_gpu/requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
RUN rm requirements.txt
