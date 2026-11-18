#!/bin/bash
# Installation Docker pour CentOS 7 (lab EazyTraining / EC2)
set -e

echo "=== Fix repos CentOS 7 (vault) ==="
if [ -f /etc/yum.repos.d/CentOS-Base.repo ]; then
  sed -i 's/mirrorlist.centos.org/vault.centos.org/g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i 's/^mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i 's/^#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-Base.repo
fi

echo "=== Prerequisites ==="
yum install -y yum-utils device-mapper-persistent-data lvm2 curl

echo "=== Install Docker ==="
if ! command -v docker >/dev/null 2>&1; then
  curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
  sh /tmp/get-docker.sh
fi

echo "=== Start Docker ==="
systemctl daemon-reload
systemctl enable docker
systemctl start docker
docker --version
systemctl is-active docker
