# Docker NodeJS Container (marvambass/nodejs)
_maintained by MarvAmBass_

[FAQ - All you need to know about the marvambass Containers](http://marvin.im/posts/IT/Docker/marvambass/FAQ__All_you_need_to_know_about_the_marvambass_Containers.html)

## What is it

This Dockerfile (available as ___marvambass/nodejs___) gives you a NodeJS Container, where you can specify the NodeJS Version you want to use.
By default it uses the current stable Version.

To configure the Container you use environment Variables.

It's based on the [ubuntu:14.04](https://registry.hub.docker.com/_/ubuntu/) Image

View in Docker Registry [marvambass/nodejs](https://registry.hub.docker.com/u/marvambass/nodejs/)

View in GitHub [MarvAmBass/docker-nodejs](https://github.com/MarvAmBass/docker-nodejs)

## Environment variables and defaults

### NodeJS Version

* __NODE\_Version__
 * optional - if not set, the container uses the stable version it downloaded at container build
 * set this to any NodeJS Version supported by _creationix/nvm_ for example 'NODE_VERSION=v0.10.0'
 * there is also something special here, if you want the absolutly current version of the current time, you can use 'NODE_VERSION=stable' and the current stable version will be downloaded
 
## Usage

This container is made to be your Base Image, so the best way to use it is to build your own Dockerfile on top of it.

The Container uses [creationix/nvm](https://github.com/creationix/nvm) as NodeJS Version Manager, so you're free to use any Version available there.

You should'nt overwrite the __ENTRYPOINT__ because then you're no longer able to use my Environment Variable settings.

You are also able to execute Dockers __CMD__ as usual, as my __ENTRYPOINT__ script is a passthru for _/bin/bash_.

### Examples

The simples way:

    FROM marvambass/nodejs
    RUN wget http://example.js/nodejs-server.js -O /server.js
    EXPOSE 4000
    CMD node /server.js

If you want to use a specific NodeJS Version

    FROM marvambass/nodejs
    ENV NODE_VERSION v0.10.0
    RUN wget http://example.js/nodejs-server.js -O /server.js
    EXPOSE 4000
    CMD node /server.js

Get a BASH inside __marvambass/nodejs__ or inheriting containers

    docker run -ti marvambass/nodejs /bin/bash
    >> exec docker CMD
    /bin/bash
    root@006900a8d48c:/# node -v
    v0.10.35
    root@006900a8d48c:/# 

You also can check my containers who use __marvambass/nodejs__ - so you get a better look on how to use this container.

* [MarvAmBass/docker-ghost](https://github.com/MarvAmBass/docker-ghost)
