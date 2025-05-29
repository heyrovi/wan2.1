FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

WORKDIR /app

# ✅ Mirror-Fix: Vermeidet Netzwerkprobleme mit archive.ubuntu.com
RUN sed -i 's|http://archive.ubuntu.com|http://mirror.kakao.com/ubuntu|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y \
        python3 python3-pip python3-dev \
        python3-setuptools python3-wheel \
        build-essential ffmpeg git && \
    apt-get clean

# ✅ Kopiere lokalen Code in Container
COPY . .

# ✅ Installiere Python-Dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
