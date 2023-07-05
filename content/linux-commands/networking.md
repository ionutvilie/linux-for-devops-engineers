---
title: "Networking"
date: 2023-07-05T08:19:54+03:00
weight: 24
draft: false
---

## `ip` & `ifconfig`

ip - show / manipulate routing, network devices, interfaces and tunnels
ifconfig - configure a network interface

```bash
ip address show eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether dc:a6:32:ac:da:5b brd ff:ff:ff:ff:ff:ff
    inet 192.168.100.10/24 brd 192.168.100.255 scope global dynamic eth0
       valid_lft 170906sec preferred_lft 170906sec
    inet6 fe80::dea6:32ff:feac:da5b/64 scope link
       valid_lft forever preferred_lft forever

ifconfig eth0
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.100.10  netmask 255.255.255.0  broadcast 192.168.100.255
        inet6 fe80::dea6:32ff:feac:da5b  prefixlen 64  scopeid 0x20<link>
        ether dc:a6:32:ac:da:5b  txqueuelen 1000  (Ethernet)
        RX packets 2508154727  bytes 876813076579 (876.8 GB)
        RX errors 185085  dropped 71761560  overruns 0  frame 0
        TX packets 3770704443  bytes 5244870710506 (5.2 TB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

## `ping`

The ping utility uses the ICMP protocol's mandatory ECHO\_REQUEST datagram to elicit an ICMP ECHO\_RESPONSE from a host or gateway

```bash
# ping find out if a host is alive
# this command causes false negative if ICMP protocol is blocked by the host
PING google.ro (172.217.19.99): 56 data bytes
64 bytes from 172.217.19.99: icmp_seq=0 ttl=118 time=32.413 ms
64 bytes from 172.217.19.99: icmp_seq=1 ttl=118 time=32.734 ms
64 bytes from 172.217.19.99: icmp_seq=2 ttl=118 time=31.968 ms
```

## `dig`

dig \(domain information groper\) is a flexible tool for interrogating DNS name servers.

```bash
# print the destination IP for the A Record
$ dig +short google.ro
172.217.18.67
# print answer section only
$ dig +noall +answer google.ro
google.ro.        138    IN    A    172.217.19.99
```

## `nslookup`

Nslookup is a program to query Internet domain name servers.

```bash
$ nslookup google.ro
Server:        192.168.100.1
Address:    192.168.100.1#53

Non-authoritative answer:
Name:    google.ro
Address: 172.217.18.67
```

## `traceroute`

traceroute -- print the route packets take to network host

```bash
$ traceroute google.ro
traceroute to google.ro (172.217.19.99), 64 hops max, 52 byte packets
 1  192.168.100.1 (192.168.100.1)  4.364 ms  1.155 ms  0.993 ms
 2  109.98.30.1 (109.98.30.1)  3.786 ms  3.916 ms  3.441 ms
13  bud02s27-in-f3.1e100.net (172.217.19.99)  32.314 ms  33.097 ms  31.379 ms
```

## `telnet`

User interface to the TELNET protocol. Useful to test remote open ports.

```bash
# port is open but refused to accept telnet connection
$ telnet 192.168.100.128 8080
Trying 192.168.100.128...
telnet: connect to address 192.168.100.128: Connection refused
telnet: Unable to connect to remote host
# port is not open
$ telnet 192.168.1.128 8081
Trying 192.168.1.128...
^C
```

## Others

```bash
hostname  # print hostname or fqdn

```
