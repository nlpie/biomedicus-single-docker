#!/usr/bin/env bash

exec 3< <(biomedicus deploy)
sed '/Done deploying all servers.$/q' <&3 ; cat <&3 &

biomedicus run /input --watch -o /output
