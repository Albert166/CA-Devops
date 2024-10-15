# Dockefile for task5
# Arg is a variable which can be used in dockerfiles it is used when doing docker build command
FROM ubuntu:latest
CMD [ "echo", "Hello world" ]

# For example you can do docker build --build-arg UBUNTU_VERSION=rolling--tag "ubunturolling" .

