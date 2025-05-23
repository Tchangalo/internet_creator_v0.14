#!/bin/bash

C='\033[0;94m'
NC='\033[0m'

useradd -m -s /bin/bash user
usermod -aG sudo user
echo "Enter a new user (sudo) password:"
passwd user
mkdir -p /home/user/.ssh
chown user:user /home/user/.ssh
chmod 700 /home/user/.ssh
touch /home/user/.ssh/authorized_keys
chown user:user /home/user/.ssh/authorized_keys
chmod 600 /home/user/.ssh/authorized_keys
touch /home/user/.ssh/known_hosts
chown user:user /home/user/.ssh/known_hosts
chmod 644 /home/user/.ssh/known_hosts

echo "Host p1r1v
     HostName 10.20.30.11
Host p1r2v
     HostName 10.20.30.12
Host p1r3v
     HostName 10.20.30.13
Host p1r4v
     HostName 10.20.30.14
Host p1r5v
     HostName 10.20.30.15
Host p1r6v
     HostName 10.20.30.16
Host p1r7v
     HostName 10.20.30.17
Host p1r8v
     HostName 10.20.30.18
Host p1r9v
     HostName 10.20.30.19
Host p1r10m
     HostName 10.20.30.110
Host p1r11m
     HostName 10.20.30.111
Host p1r12m
     HostName 10.20.30.112

Host p2r1v
     HostName 10.20.30.21
Host p2r2v
     HostName 10.20.30.22
Host p2r3v
     HostName 10.20.30.23
Host p2r4v
     HostName 10.20.30.24
Host p2r5v
     HostName 10.20.30.25
Host p2r6v
     HostName 10.20.30.26
Host p2r7v
     HostName 10.20.30.27
Host p2r8v
     HostName 10.20.30.28
Host p2r9v
     HostName 10.20.30.29

Host p3r1v
     HostName 10.20.30.31
Host p3r2v
     HostName 10.20.30.32
Host p3r3v
     HostName 10.20.30.33
Host p3r4v
     HostName 10.20.30.34
Host p3r5v
     HostName 10.20.30.35
Host p3r6v
     HostName 10.20.30.36
Host p3r7v
     HostName 10.20.30.37
Host p3r8v
     HostName 10.20.30.38
Host p3r9v
     HostName 10.20.30.39

Host p*r*v
     User vyos
Host p*r*m
     User admin

Host dhcp1
     HostName 192.168.10.31
     User user
Host dhcp2
     HostName 192.168.10.32
     User user
Host dhcp3
     HostName 192.168.10.33
     User user" >> /home/user/.ssh/config

chown user:user /home/user/.ssh/config
chmod 600 /home/user/.ssh/config

echo "alias ipbc='ip -br -c a'
alias b='bpytop'
alias go='./go.sh'

alias p1r1v='ssh p1r1v'
alias p1r2v='ssh p1r2v'
alias p1r3v='ssh p1r3v'
alias p1r4v='ssh p1r4v'
alias p1r5v='ssh p1r5v'
alias p1r6v='ssh p1r6v'
alias p1r7v='ssh p1r7v'
alias p1r8v='ssh p1r8v'
alias p1r9v='ssh p1r9v'
alias p1r10m='ssh p1r10m'
alias p1r11m='ssh p1r11m'
alias p1r12m='ssh p1r12m'

alias p2r1v='ssh p2r1v'
alias p2r2v='ssh p2r2v'
alias p2r3v='ssh p2r3v'
alias p2r4v='ssh p2r4v'
alias p2r5v='ssh p2r5v'
alias p2r6v='ssh p2r6v'
alias p2r7v='ssh p2r7v'
alias p2r8v='ssh p2r8v'
alias p2r9v='ssh p2r9v'

alias p3r1v='ssh p3r1v'
alias p3r2v='ssh p3r2v'
alias p3r3v='ssh p3r3v'
alias p3r4v='ssh p3r4v'
alias p3r5v='ssh p3r5v'
alias p3r6v='ssh p3r6v'
alias p3r7v='ssh p3r7v'
alias p3r8v='ssh p3r8v'
alias p3r9v='ssh p3r9v'

alias dhcp1='ssh dhcp1'
alias dhcp2='ssh dhcp2'
alias dhcp3='ssh dhcp3'" >> /home/user/.bashrc

cd /home/user/
python3 -m venv .venv
chown -R user:user .venv
source .venv/bin/activate
pip3 install -U setuptools wheel scp ansible paramiko flask flask-socketio
deactivate

sudo -u user bash <<EOF
cd /home/user/.ssh
ssh-keygen -t ed25519 -f id_ed25519 -N ""
EOF
# echo "Defaults timestamp_timeout=120" | sudo EDITOR='tee -a' visudo
echo "user ALL=(ALL:ALL) NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo

echo -e "${C}The user 'user' has been set up and configured successfully.${NC}"
