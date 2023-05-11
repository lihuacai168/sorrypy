
FROM python:3.9-slim


ARG DEBIAN_REPO="deb.debian.org"
ARG PIP_INDEX_URL="https://pypi.org/simple"

# replace sources.list, if use docker-compose
RUN echo "deb http://$DEBIAN_REPO/debian/ buster main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://$DEBIAN_REPO/debian/ buster main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://$DEBIAN_REPO/debian-security buster/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://$DEBIAN_REPO/debian-security buster/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://$DEBIAN_REPO/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://$DEBIAN_REPO/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list


RUN apt-get update && \
    apt-get install -y ffmpeg ttf-wqy-microhei

RUN mkdir /usr/src/app -p

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN pip install -r requirements.txt -i ${PIP_INDEX_URL}

EXPOSE 15000

CMD python app.py
            