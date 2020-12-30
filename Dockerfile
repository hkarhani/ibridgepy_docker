FROM ubuntu:bionic 

RUN apt update

RUN apt install -y software-properties-common
RUN apt install -y python3.7 python3.7-dev python3-pip zip unzip 
RUN pip3 install jupyter numpy pandas matplotlib cufflinks requests

COPY * /root/
WORKDIR /root/
RUN unzip *.zip
RUN rm *.zip

CMD jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root --NotebookApp.token=''