ARG BUILD_FROM
FROM $BUILD_FROM

ENV TERM=xterm
ENV LANG C.UTF-8

RUN apk add --update --no-cache git curl ncurses gcc python3 python3-dev musl-dev

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && pip install git+https://github.com/pimoroni/enviroplus-python.git#egg=enviroplus\&subdirectory=library \
    && pip install paho-mqtt rpi.gpio \
    && mkdir /enviroplus2mqtt \
    && git clone https://github.com/hotplot/enviroplus-mqtt.git /enviroplus2mqtt/enviroplus-mqtt


COPY run.sh "/run.sh"

RUN ["chmod", "a+x", "./run.sh"]
CMD [ "./run.sh" ]
