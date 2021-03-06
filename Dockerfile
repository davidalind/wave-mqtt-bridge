FROM alpine:3.7
RUN apk update
RUN apk add python2 py2-pip build-base glib glib-dev linux-headers
RUN mkdir /wave-mqtt-bridge
COPY src/* /wave-mqtt-bridge/
COPY entrypoint.sh /docker-entrypoint.sh
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
RUN pip2 install --upgrade pip
RUN pip2 install bluepy 
RUN pip2 install paho-mqtt
RUN apk del build-base glib-dev
ENTRYPOINT ["/docker-entrypoint.sh"]
