FROM alpine:latest

RUN apk add qemu-img qemu-system-x86_64 qemu-modules
ADD entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT '/usr/bin/entrypoint.sh'
