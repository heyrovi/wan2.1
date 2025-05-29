FROM runpod/python:3.10-uv

WORKDIR /app

RUN apt-get update && apt-get install -y ffmpeg git

COPY . .

RUN pip install torch==2.1.2+cu118 torchvision==0.16.2+cu118 torchaudio==2.1.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu118
RUN pip install -r requirements.txt
RUN pip install -r wan21/requirements.txt
