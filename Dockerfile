FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update && apt-get -y install \
    cmake \
    libsm6 \
    libxext6\
    libxrender-dev

WORKDIR /DLCV


COPY requirements.txt /DLCV/
RUN pip install -r /DLCV/requirements.txt

CMD ["tail", "-f", "/dev/null"]
