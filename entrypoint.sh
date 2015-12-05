#!/bin/sh

if [ -f /usr/share/docker/ip ]; then
  ip="-ip $(cat /usr/share/docker/ip)"
fi

/bin/registrator $ip $@
