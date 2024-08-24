# bastion-practice

## Build containers

```bash
git clone https://github.com/r1k0t3k1/bastion-practice.github

cd bastion-practice

docker compose build
docker compose up -d
```

## SSH to bastion container

Default password is `toor`.

```bash
# On host computer
ssh root@localhost:2222
```

## Linux

### SSH Local port forward

```bash
ssh root@localhost -p 2222 \
    -L 8888:internal-server:80 \
    -L 22222:internal-server:22
```

### SSH ProxyJump using LocalForward

`~/.ssh/config`

```
Host bastion
    HostName localhost
    Port 2222
    User root
    LocalForward 8888 bastion:8888

Host internal-server
    HostName internal-server
    Port 22
    User root
    ProxyJump bastion
    LocalForward 8888 internal-server:80
```

```bash
# First, input bastion password, then input internal-server password.
ssh internal-server
```

### SSH Dynamic port forward

```bash
ssh root@localhost -p 2222 -D 10080
```

Add proxy address to proxychains config.

```bash
echo "socks5 127.0.0.1 10080" >> /etc/proxychains4.conf
```

```bash
proxychains4 -q /bin/bash
```

From now on, communication generated from this shell will go through the proxy.
