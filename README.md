# docker-nfs-client

Docker image for a light NFS client (~10.9MB). By default NFS 4 is used.

Based on https://github.com/evq/nfs-client.

## Usage

### Build

    $ docker build -t nfs-client .

### Run

    $ docker run -it --privileged=true --net=host -v /mnt/nfs-1 -e SERVER=192.168.0.9 -e SHARE=movies nfs-client

or, detached:

    $ docker run -itd --privileged=true --net=host -v /mnt/nfs-1 -e SERVER=192.168.0.9 -e SHARE=movies nfs-client

or, with some more options:

```
$ docker run -itd \
    --name nfs-vols \
    --restart=always \
    --privileged=true \
    --net=host \
    -v /:/mnt/host \
    -e SERVER=192.168.0.9 \
    -e SHARE=movies \
    -e MOUNT_OPTIONS="nfsvers=3,ro" \
    -e FSTYPE=nfs3 \
    -e MOUNTPOINT=/mnt/host/mnt/nfs-1 \
      nfs-client
```

### Tag and Push

    $ docker tag -f nfs-client flaccid/nfs-client
    $ docker push flaccid/nfs-client

## Caveat

Currently isn't very useful beyond being the basis for other containers,
[internally mounted nfs volumes can't be shared to other
containers.](https://github.com/docker/docker/issues/4213)


License and Authors
-------------------
- Author: Chris Fordham (<chris@fordham-nagy.id.au>)

```text
The MIT License (MIT)

Copyright (c) 2015 Evey Quirk
Copyright (c) 2015 Chris Fordham

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
