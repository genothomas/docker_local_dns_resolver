#!/bin/bash
BIND_VERSION="9-10-4-p2"
BIND_PATH="/opt/bind"
TEMP_PATH="/tmp/bind"
export DEBIAN_FRONTEND=noninteractive
echo "Updating OS and installing packages"
apt-get update -qq
apt-get upgrade -qq -y 
apt-get dist-upgrade -qq -y 
apt-get install -qq -y \
    ca-certificates \
    sudo \
    git \
    supervisor \
    software-properties-common \
    language-pack-en-base \
    build-essential \
    libssl-dev \
    curl
apt-get autoremove -qq -y
apt-get autoclean -qq
mkdir -p "${BIND_PATH}"
mkdir -p "${TEMP_PATH}"
curl -o "${TEMP_PATH}.tgz" "https://www.isc.org/downloads/file/bind-${BIND_VERSION}/?version=tar-gz"
cd "${TEMP_PATH}"
tar -zxf "${TEMP_PATH}.tgz" --strip-components 1
./configure --prefix="${BIND_PATH}" --disable-linux-caps && make && make install
mv /opt/build/scripts/run.sh /opt/run.sh
mkdir -p /opt/logs
mkdir -p /opt/bind/var/cache
rm -f /etc/supervisord.conf
mv /opt/build/config/supervisord.conf /etc/supervisord.conf
rm -rf /etc/supervisord
mv /opt/build/config/supervisord /etc/supervisord
rm -f "${TEMP_PATH}.tgz"
rm -rf "${TEMP_PATH}"
rm -rf /opt/build
echo "Build complete"
exit 0
