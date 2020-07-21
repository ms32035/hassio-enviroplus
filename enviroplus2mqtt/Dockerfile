ARG BUILD_FROM
FROM $BUILD_FROM

ENV TERM=xterm
ENV LANG C.UTF-8

RUN apk add --update --no-cache git curl ncurses gcc python3 python3-dev musl-dev make linux-headers libffi-dev

ADD requirements.txt .

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && pip install -r requirements.txt \
    && mkdir /enviroplus2mqtt \
    && git clone https://github.com/ms32035/enviroplus-mqtt.git /enviroplus2mqtt/enviroplus-mqtt \
    && cd enviroplus2mqtt/enviroplus-mqtt \
    && git reset --hard d805e778529fd9c28f0a24813121e55cb6c8f68a


COPY run.sh "/run.sh"

RUN ["chmod", "a+x", "./run.sh"]
CMD [ "./run.sh" ]
