#! bin/bash
#refers: https://gist.github.com/virtualstaticvoid/1024546
#https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands
# * for docke , need to restart 'docker' service after run this script
# * for fail2ban, need to uninstall and reinstall it after run this script

ETH0="ens3"

# 01. Delete all old rules
sudo iptables -Z
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X

# 05. Allow loopback
sudo iptables -A INPUT  -i lo -p all -j ACCEPT
sudo iptables -A OUTPUT -o lo -p all -j ACCEPT

# 04. Drop invalid packets
#sudo iptables -A INPUT   -m conntrack --ctstate INVALID -j DROP
#sudo iptables -A FORWARD -m conntrack --ctstate INVALID -j DROP
#sudo iptables -A OUTPUT  -m conntrack --ctstate INVALID -j DROP

# Keep all established and related incoming/output connections
sudo iptables -A INPUT  -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 06. Ping from inside to outside / outside to inside
sudo iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
sudo iptables -A INPUT  -p icmp --icmp-type echo-reply   -j ACCEPT
sudo iptables -A INPUT  -p icmp --icmp-type echo-request -j ACCEPT
sudo iptables -A OUTPUT -p icmp --icmp-type echo-reply   -j ACCEPT

# 04. Allow DNS
sudo iptables -A INPUT  -p udp -i $ETH0 --sport 53 -j ACCEPT
sudo iptables -A OUTPUT -p udp -o $ETH0 --dport 53 -j ACCEPT

# 04. Allow NTP
sudo iptables -A INPUT  -p udp -i $ETH0 --sport 123 -j ACCEPT
sudo iptables -A OUTPUT -p udp -o $ETH0 --dport 123 -j ACCEPT

# DHCP
#sudo iptables -A INPUT   -p udp -m state --state ESTABLISHED,RELATED --sport 67:68 -j ACCEPT
#sudo iptables -A OUTPUT  -p udp -m udp   --dport 67:68 -j ACCEPT

# 07 Allow all incoming/outgoing SSH
sudo iptables -A INPUT  -i $ETH0 -p tcp --dport 2020 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -o $ETH0 -p tcp --sport 2020 -m state --state ESTABLISHED     -j ACCEPT
#sudo iptables -A OUTPUT -o $ETH0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A INPUT  -i $ETH0 -p tcp --sport 22 -m state --state ESTABLISHED     -j ACCEPT

# 09 Allow all incoming/outgoing HTTP and HTTPS
sudo iptables -A INPUT  -p tcp -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --sports 80,443 -m conntrack --ctstate ESTABLISHED     -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT  -p tcp -m multiport --sports 80,443 -m conntrack --ctstate ESTABLISHED     -j ACCEPT

# 08. Setup docker0, check if docker0 exist when `ifconfig`
sudo iptables -t nat -A POSTROUTING ! -o docker0  -s 172.17.0.0/16 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o $ETH0 -j MASQUERADE
sudo iptables -A FORWARD -i docker0 -o $ETH0   -j ACCEPT
sudo iptables -A FORWARD -i $ETH0   -o docker0 -j ACCEPT

# 10. Shadowsocks server
sudo iptables -A INPUT  -i $ETH0 -p tcp --dport 2019 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -o $ETH0 -p tcp --sport 2019 -m state --state ESTABLISHED     -j ACCEPT
sudo iptables -A INPUT  -i $ETH0 -p udp --dport 2019 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -o $ETH0 -p udp --sport 2019 -m state --state ESTABLISHED     -j ACCEPT

# 11. Postgresql
#sudo iptables -A INPUT -p tcp -s 15.15.15.0/24 --dport 5432 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -p tcp --sport 5432 -m conntrack --ctstate ESTABLISHED -j ACCEPT


# 20. Allow packets from internal network to reach external network.
# if eth1 is connected to external network (internet)
# if eth0 is connected to internal network (192.168.1.x)
#sudo iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT

# 21. Port forwarding 422 to 22
#sudo iptables -t nat -A PREROUTING -p tcp -d 192.168.102.37 --dport 422 -j DNAT --to 192.168.102.37:22
#sudo iptables -A INPUT -i eth0 -p tcp --dport 422 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -o eth0 -p tcp --sport 422 -m state --state ESTABLISHED -j ACCEPT

# 19. Allow MySQL connection only from a specific network
#sudo iptables -A INPUT -i eth0 -p tcp -s 192.168.200.0/24 --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -o eth0 -p tcp --sport 3306 -m state --state ESTABLISHED -j ACCEPT

# 20. Allow Sendmail or Postfix
#sudo iptables -A INPUT -i eth0 -p tcp --dport 25 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -o eth0 -p tcp --sport 25 -m state --state ESTABLISHED -j ACCEPT

# 21. Allow IMAP and IMAPS
#sudo iptables -A INPUT -i eth0 -p tcp --dport 143 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -o eth0 -p tcp --sport 143 -m state --state ESTABLISHED -j ACCEPT
#sudo iptables -A INPUT -i eth0 -p tcp --dport 993 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -o eth0 -p tcp --sport 993 -m state --state ESTABLISHED -j ACCEPT

# 22. Allow POP3 and POP3S
#sudo iptables -A INPUT -i eth0 -p tcp --dport 110 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -o eth0 -p tcp --sport 110 -m state --state ESTABLISHED -j ACCEPT
#sudo iptables -A INPUT -i eth0 -p tcp --dport 995 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -o eth0 -p tcp --sport 995 -m state --state ESTABLISHED -j ACCEPT

# 23. Prevent DoS attack
#sudo iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT
### Stop smurf attacks
#sudo iptables -A INPUT -p icmp -m icmp --icmp-type address-mask-request -j DROP
#sudo iptables -A INPUT -p icmp -m icmp --icmp-type timestamp-request -j DROP
### Drop excessive RST packets to avoid smurf attacks
#sudo iptables -A INPUT -p tcp -m tcp --tcp-flags RST RST -m limit --limit 2/second --limit-burst 2 -j DROP

#Protection from PING of Death attack
sudo iptables -N PING_OF_DEATH
sudo iptables -A PING_OF_DEATH -p icmp --icmp-type echo-request -m hashlimit --hashlimit 1/s --hashlimit-burst 10 --hashlimit-htable-expire 300000 --hashlimit-mode srcip --hashlimit-name t_PING_OF_DEATH -j RETURN
sudo iptables -A PING_OF_DEATH -j DROP
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j PING_OF_DEATH

##prevent port scanning, SYN flood attacks, invalid packages, malformed XMAS packets, NULL packets, etc.
sudo iptables -N PORTSCAN
sudo iptables -A PORTSCAN -p tcp --tcp-flags ACK,FIN FIN -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags ACK,PSH PSH -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags ACK,URG URG -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags SYN,ACK SYN,ACK -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags ALL ALL -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags ALL NONE -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags ALL FIN,PSH,URG -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags ALL SYN,FIN,PSH,URG -j DROP
sudo iptables -A PORTSCAN -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
# drop fragmented packages
sudo iptables -A INPUT -f -j DROP
# SYN packets check
sudo iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# 36 Block the port for internal access only
#sudo iptables -A INPUT -p tcp --dport 9000 -s 127.0.0.0/8 -j ACCEPT
#sudo iptables -A INPUT -p tcp --dport 9000 -j REJECT
#sudo iptables -A INPUT -p tcp --dport 9090 -s 127.0.0.0/8 -j ACCEPT
#sudo iptables -A INPUT -p tcp --dport 9090 -j REJECT
#sudo iptables -A INPUT -p tcp --dport 9091 -s 127.0.0.0/8 -j ACCEPT
#sudo iptables -A INPUT -p tcp --dport 9091 -j REJECT

#### 02. Set default policy to drop
sudo iptables -A INPUT   -j DROP
sudo iptables -A FORWARD -j ACCEPT
sudo iptables -A OUTPUT  -j ACCEPT


# IPV6
#IP6TABLES="/sbin/ip6tables"
#[ -x $IP6TABLES ] || { echo "Error: $IP6TABLES not found" ; exit 1 ; }

## Flush rules
#sudo $IP6TABLES -F
#sudo $IP6TABLES -X
#sudo $IP6TABLES -Z

## Accept everything on the loopback interface
#sudo $IP6TABLES -A INPUT -i lo -j ACCEPT
#sudo $IP6TABLES -A OUTPUT -o lo -j ACCEPT

## enable output
##sudo $IP6TABLES -A OUTPUT -o $ETH0 -j ACCEPT

##### Default rule: reject every packet (incoming, outgoing and forwarded)
#sudo $IP6TABLES -P INPUT   DROP
#sudo $IP6TABLES -P OUTPUT  DROP
#sudo $IP6TABLES -P FORWARD DROP

### common port
#FTP - 21 TCP
#SSH - 22 TCP
#TELNET - 23 TCP
#SMTP - 25 TCP
#DNS - 53 TCP/UDP
#DHCP - 67 , 68 DHCP
#HTTP - 80 TCP
#POP3 - 110 TCP
#IMAP - 143 TCP
#HTTPS - 443 TCP
#VNC - 5900-6000
#IRC - 6667-7000
#Gmail SMTP TLS: 587
#Gmail SMTP SSL: 465
#Gmail POP SSL: 995
#Gmail IMAP SSL: 993

echo "=> restart docker service..."
sudo systemctl daemon-reload
sudo systemctl restart docker
echo "=> reinstall fail2ban..."
sudo apt remove  fail2ban -y
sudo apt install fail2ban -y

sudo iptables -A DOCKER-USER -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A DOCKER-USER -p tcp --dport 2019 -j ACCEPT
sudo iptables -A DOCKER-USER -j DROP
echo "=> done"


# ifconfig
# brctl show docker0
# docker network ls
# docker network inspect bridge
# view port for container
# sudo nsenter -t $(docker inspect -f '{{.State.Pid}}' container_name_or_id) -n netstat
