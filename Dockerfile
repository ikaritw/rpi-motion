#FROM resin/rpi-raspbian:latest
FROM balenalib/rpi-raspbian:latest

RUN apt-get update && apt-get upgrade && apt-get install motion
RUN mkdir /mnt/motion && chown motion /mnt/motion
COPY motion.conf /etc/motion/motion.conf

VOLUME /mnt/motion
EXPOSE 8081
EXPOSE 8080
ENTRYPOINT ["motion"]
