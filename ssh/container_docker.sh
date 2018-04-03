#!/bin/sh
NAME="apm_ssh"

PORT="-p 31338:22"

OPTION="--rm"

sudo docker run --name $NAME $PORT -i -t -d $OPTION $SHARED $NAME:1.0 /bin/sh
