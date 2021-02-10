ARG BUILD_FROM
FROM $BUILD_FROM

ENV TERM=xterm
ENV LANG C.UTF-8

RUN echo "nameserver 1.1.1.1" > /etc/resolv.conf \
    && apk add --update --no-cache git curl ncurses gcc python3 python3-dev musl-dev make linux-headers libffi-dev

ADD requirements.txt .

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && pip install -q -r requirements.txt \
    && mkdir /enviroplus2mqtt \
    && git clone https://github.com/ms32035/enviroplus-mqtt.git /enviroplus2mqtt/enviroplus-mqtt \
    && cd enviroplus2mqtt/enviroplus-mqtt \
    && git reset --hard 9ecbe1458e229600e7c0f54630209d8f2d9e1b93


COPY run.sh "/run.sh"

RUN ["chmod", "a+x", "./run.sh"]
CMD [ "./run.sh" ]
