## docker-nfs-client

Docker image for a light NFS client. By default NFS 4 is used.
Inspiration from https://github.com/evq/nfs-client.

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


License and Authors
-------------------
- Author: Chris Fordham (<chris@fordham-nagy.id.au>)

```text
Copyright 2015, Chris Fordham

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
