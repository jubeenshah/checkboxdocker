#!/bin/bash
set -m

mongodb_cmd="mongod --bind_ip_all"
cmd="$mongodb_cmd"

if [ "$AUTH" == "yes" ]; then
    cmd="$cmd --auth"
fi

$cmd &

if [ ! -f /data/db/.mongodb_password_set ]; then
    /setPassword.sh
fi

fg
