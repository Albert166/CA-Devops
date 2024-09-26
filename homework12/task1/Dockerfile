# Dockerfile to create a python3 image which prints hello world.
FROM ubuntu:latest
RUN apt-get update && apt-get install -y python3
COPY ./script /script
WORKDIR /script
ENTRYPOINT [ "python3"]
CMD [ "script.py" ]
