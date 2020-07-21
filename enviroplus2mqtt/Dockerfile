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
    && git clone https://github.com/hotplot/enviroplus-mqtt.git /enviroplus2mqtt/enviroplus-mqtt \
    && cd enviroplus2mqtt/enviroplus-mqtt \
    && git reset --hard 06a5501ca208198fabe7cfcf99f2b25ef90b019e


COPY run.sh "/run.sh"

RUN ["chmod", "a+x", "./run.sh"]
CMD [ "./run.sh" ]
