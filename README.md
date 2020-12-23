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
sudo ./squid3-install.sh -p 49223 -u User -s Pass
```


# Create Users (info)

To create users, run
```
/usr/bin/htpasswd -b -c /etc/squid/passwd USERNAME_HERE PASSWORD_HERE
```

To update password for am existing user, run

```
/usr/bin/htpasswd /etc/squid/passwd USERNAME_HERE
```

Create a firewall rule
# ![logo](/assets/firewall.png) Firewall
