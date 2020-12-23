# squid-proxy-installer

Auto install Squid 3 proxy on

Ubuntu 16.04

## Install Squid

To install, run the script

```
wget https://raw.githubusercontent.com/andreybrigunet/squid-proxy-installer/master/squid3-install.sh
chmod 755 squid3-install.sh
sudo ./squid3-install.sh
```

# Input arguments 
    -p Port
    -u UserName 
    -s Password

Exemple  
```
sudo ./squid3-install.sh -p 49223 -u User  -s Pass
```
