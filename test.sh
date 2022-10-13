# bash <(curl -s https://raw.githubusercontent.com/s3111/vm-setup/main/test.sh)
# bash <(wget -qO- https://raw.githubusercontent.com/s3111/vm-setup/main/test.sh)


apt-get update
apt-get -y upgrade
apt-get install -y build-essential
mkdir 3dproxy
cd 3dproxy/
wget https://github.com/z3APA3A/3proxy/archive/0.8.12.tar.gz
tar xzf 0.8.12.tar.gz
cd 3proxy-0.8.12/
make -f Makefile.Linux

mkdir -p /var/log/3proxy
mkdir /etc/3proxy
cp src/3proxy /usr/bin/

adduser --system --disabled-login --no-create-home --group proxy3
chown proxy3:proxy3 -R /etc/3proxy
chown proxy3:proxy3 /usr/bin/3proxy
chown proxy3:proxy3 /var/log/3proxy
