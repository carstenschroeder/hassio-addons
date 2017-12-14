ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk update && apk add bash avahi-tools avahi-compat-libdns_sd screen python git py-tornado jq python git py-pip make sudo wget
WORKDIR /home/app
RUN wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pybonjour/pybonjour-1.1.1.tar.gz
RUN tar -zxf pybonjour-1.1.1.tar.gz
RUN cd pybonjour-1.1.1 && /usr/bin/python setup.py install
RUN git clone https://github.com/Tristan79/iBrew.git

EXPOSE 2080

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]