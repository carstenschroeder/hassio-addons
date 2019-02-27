ARG BUILD_FROM=hassioaddons/base:2.3.2
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache jq sshpass rsync

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]