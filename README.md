# docker-nfs-client

Docker image for a light NFS client (~10.9MB). By default NFS 4 is used.

Based on https://github.com/evq/nfs-client.

## Usage

### Build

    $ docker build -t nfs-client .

### Run

Basic example, mounting NFS within container:

    $ docker run -it --privileged=true --net=host -v /mnt/nfs-1 -e SERVER=192.168.0.9 -e SHARE=movies nfs-client

Writing back to the host:

    $ docker run -itd \
        --privileged=true \
        --net=host \
        --name nfs-movies \
        -v /media/nfs-movies:/mnt/nfs-1:shared \
        -e SERVER=192.168.0.9 \
        -e SHARE=movies \
          nfs-client

Take note of the historic 'NFS shares and volumes don't mix' ([#4213](https://github.com/docker/docker/issues/4213)) to use `shared` or `rshared` as needed when needing to use `--volumes-from` with other containers. Additionally, after the container is killed you'll need to unmount the host mount too.

#### Runtime Environment Variables

There should be a reasonable amount of flexibility using the available variables. If not please raise an issue so your use case can be covered!

- `SERVER` - the hostname of the NFS server to connect to
- `SHARE` - the name of the NFS share to mount
- `MOUNT_OPTIONS` - mount options to mount the NFS share with
- `FSTYPE` - the filesystem type; specify `nfs3` for NFSv3, default is `nfs` i.e. NFSv4
- `MOUNTPOINT` - the mount point for the NFS share within the container

### Tag and Push

    $ docker tag -f nfs-client flaccid/nfs-client
    $ docker push flaccid/nfs-client

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
