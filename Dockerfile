FROM python:3.9.18@sha256:e730f8ac1ff165f22c88b5fc9d3e53668ee3e80ea1aefe06c7f06f69da14e83d
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

WORKDIR /work
COPY ./requirements.txt /root
RUN pip install -r /root/requirements.txt
COPY ./.vimrc /root

