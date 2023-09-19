ARG PYTORCH="1.7.1"
ARG CUDA="11.0"
ARG CUDNN="8"


FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-devel

ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0+PTX"
ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
ENV CMAKE_PREFIX_PATH="$(dirname $(which conda))/../"

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC
RUN apt-get update
RUN apt-get install -y ffmpeg libsm6 libxext6 git ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install matplotlib numpy termcolor scipy navpy



################ user setting ################
RUN apt update
RUN apt install -y sudo

ARG  HOST_USER=ubuntu
ARG  UNAME=${HOST_USER}
ARG  HOME=/home/${UNAME}
ARG  MAINPC_IP=localhost
ARG  UID=1000
ARG  GID=1000

RUN  groupadd --system --gid ${GID} ${UNAME} \
 &&  useradd -rm -d ${HOME} -s /bin/bash -g root -G sudo,audio,video,plugdev -u ${UID} ${UNAME} \
 &&  usermod -aG dialout ${UNAME} \
 &&  usermod -aG sudo ${UNAME} \
 &&  mkdir -p /etc/sudoers.d \
 &&  echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UNAME} \
 &&  chmod 0440 /etc/sudoers.d/${UNAME} 

USER  ${UNAME}
WORKDIR  $HOME
