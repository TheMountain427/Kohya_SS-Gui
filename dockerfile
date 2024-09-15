# Stage 1: Base
FROM nvidia/cuda::12.1.0-cudnn8-devel-ubuntu22.04 as base

ARG KOHYA_VERSION=V21.8.5

SHELL ["/bin/bash -o", "pipefail -c"]
ENV DEBIAN_FRONTEND=noninteractive TZ=Africa/Johannesburg PYTHONUNBUFFERED=1 PIP_NO_CACHE_DIR=on SHELL=/bin/bash

# Install Ubuntu packages
RUN apt update && apt -y upgrade && apt install -y --no-install-recommends    software-properties-common         python3.10-venv         python3-pip         python3-tk         bash         git         ncdu         nginx         net-tools         openssh-server         libglib2.0-0         libsm6         libgl1         libxrender1         libxext6         ffmpeg         wget         curl         psmisc         rsync         vim         zip         unzip         p7zip-full         htop         pkg-config         libcairo2-dev         libgoogle-perftools4 libtcmalloc-minimal4         apt-transport-https ca-certificates &&     update-ca-certificates &&     apt clean &&     rm -rf /var/lib/apt/lists/* &&     echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

# Start the container
SHELL ["/bin/bash", "--login -c"]
CMD [ "/start.sh" ]
