FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update && apt-get -y install \
    cmake \
    libsm6 \
    libxext6\
    libxrender-dev 
    

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install \
    tzdata \
    python3-tk



ARG USERNAME=deeplearn
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME 

RUN mkdir -p /home/$USERNAME/.vscode-server/extensions \
        /home/$USERNAME/.vscode-server-insiders/extensions \
    && chown -R $USERNAME \
        /home/$USERNAME/.vscode-server \
        /home/$USERNAME/.vscode-server-insiders

USER $USERNAME

WORKDIR /home/$USERNAME/DL4CV
COPY requirements.txt /home/$USERNAME/DL4CV/

RUN pip install -r /home/$USERNAME/DL4CV/requirements.txt

CMD ["tail", "-f", "/dev/null"]
