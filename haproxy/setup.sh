#!/bin/bash

set -e

apt-get update
apt-get -y dist-upgrade
apt-get -y install haproxy procps

# save space
rm -rf /var/lib/apt/lists/*
