# Flush all current rules
iptables -F
iptables -X

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback interface
iptables -A INPUT -i lo -j ACCEPT

# Allow established and related traffic
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow SSH (port 22)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow HTTP and HTTPS
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Allow DNS (UDP)
iptables -A INPUT -p udp --dport 53 -j ACCEPT

# Log and Drop everything else
iptables -A INPUT -j LOG --log-prefix "Dropped Packet: "
iptables -A INPUT -j DROP

# Save firewall rules (Debian/Ubuntu)
iptables-save > /etc/iptables/rules.v4

