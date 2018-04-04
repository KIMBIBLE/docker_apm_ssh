#!/bin/sh
NAME="apm_ssh"

PORT="-p 31338:22 -p 8080:80 -p 8081:443"

#OPTION="--rm"
OPTION=""

sudo docker run --name $NAME $PORT -i -t -d $OPTION $SHARED $NAME:1.0 /bin/sh
