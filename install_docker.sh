#!/bin/bash
set -e

echo "=== Fix repos CentOS 7 ==="
if [ -f /etc/yum.repos.d/CentOS-Base.repo ]; then
  sed -i 's/mirrorlist.centos.org/vault.centos.org/g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i 's/^mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i 's/^#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-Base.repo
fi

echo "=== Install prerequisites ==="
yum install -y yum-utils device-mapper-persistent-data lvm2 curl

echo "=== Install Docker via get.docker.com ==="
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sh /tmp/get-docker.sh

echo "=== Start Docker ==="
systemctl daemon-reload
systemctl enable docker
systemctl start docker

echo "=== Verify ==="
docker --version
systemctl is-active docker
