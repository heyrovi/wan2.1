FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

WORKDIR /app

RUN apt-get update && \
    apt-get install -y python3 python3-pip git ffmpeg && \
    apt-get clean

COPY . .

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
