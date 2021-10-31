# Simple containerized kvm workload.

This is a demo of how to set up a vm inside of a docker container using qemu,
kvm, and an alipne base image.

## To use

Before running "run", you need to create a volume for your machine (this helps with persistence).

```bash
docker volume create vmvolume0
```

This volume is where a qcow/raw vm image will be stored.

Now, you should be able to run everything by building and running the container.

```
docker build -t virtualized_worker .
. run
```

## Connecting the display

By default the graphic interface is not plugged in, though VNC is set up to
show you the container's display. You can figure out the port redirection through docker ps:

```
[santiago@meme-cluster kvmstuff]$ docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED              STATUS              PORTS                                                                                      NAMES
02cd3982d862   virtualized_worker   "/bin/sh -c '/usr/bi…"   About a minute ago   Up About a minute   0.0.0.0:49156->5800/tcp, :::49156->5800/tcp, 0.0.0.0:49155->5900/tcp, :::49155->5900/tcp   inspiring_feynman
```

In this case, port 5900 of VNC is sent to 49155. This should let you use a VNC
client to connect to localhost:49155.
