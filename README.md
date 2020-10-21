# shell script for Network Monitoring on MacOS

Monitoring network on MacOS


## set up

### required
[speedtest-cli](https://pypi.org/project/speedtest-cli/)

please change speedtest-cli path as your environment.


### Find MAC Address and map en0, en2 for your env

System Preference > Network > Wi-Fi > Advanced... > Hardware > MAC Address

and hit 

```
$ ifconfig
```

find your MAC Address

In this script,

- en0: Wi-Fi
- en2: LAN


## usage

add permission and just run

```
$ chmod +x networkMonitor.sh
$ ./networkMonitor.sh
```

sample results are:

```
Download   : 48.36 Mbps
Upload     : 60.64 Mbps

External   : 123.234.123.234
Wi-Fi      : 192.168.1.19
- SSID     : kurab_2F
Ethernet   : INACTIVE
```
