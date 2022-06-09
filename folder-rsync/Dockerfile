ARG BUILD_FROM
# FROM $BUILD_FROM
FROM hassioaddons/base:8.0.6

ENV LANG C.UTF-8

RUN apk add --no-cache jq sshpass rsync

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
