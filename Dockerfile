FROM       gliderlabs/alpine:latest
MAINTAINER Chris Fordham <chris@fordham-nagy.id.au>

# USAGE
# $ docker build -t nfs-client .
# $ docker run -it --privileged=true --net=host -v /mnt/nfs-1 -e SERVER=192.168.0.9 -e SHARE=movies nfs-client
#    or detached:
#       $ docker run -itd --privileged=true --net=host -v /mnt/nfs-1 -e SERVER=192.168.0.9 -e SHARE=movies nfs-client
#    or with some more options:
#       $ docker run -itd \
#             --name nfs-vols \
#             --restart=always \
#             --privileged=true \
#             --net=host \
#             -v /:/mnt/host \
#             -e SERVER=192.168.0.9 \
#             -e SHARE=movies \
#             -e MOUNT_OPTIONS="nfsvers=3,ro" \
#             -e FSTYPE=nfs3 \
#             -e MOUNTPOINT=/mnt/host/mnt/nfs-1 \
#                nfs-client

# tag and push
# $ docker tag -f nfs-client flaccid/nfs-client
# $ docker push flaccid/nfs-client

ENV FSTYPE nfs4
ENV MOUNT_OPTIONS nfsvers=4
ENV MOUNTPOINT /mnt/nfs-1

RUN apk update
RUN apk add --update nfs-utils && rm -rf /var/cache/apk/*

# would only be used if extending an running a different main process in fg
# RUN rc-update add nfs

ADD entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
