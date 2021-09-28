#!/usr/bin/env bash
set -euo pipefail

if [ ! -d "/var/spool/squid/00" ]; then
  echo Create squit cache
  squid3 --foreground -z -d 1
fi

echo Start squit
exec squid3 --foreground -d 1
