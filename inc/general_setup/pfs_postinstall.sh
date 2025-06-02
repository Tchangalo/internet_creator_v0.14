#!/bin/bash

C='\033[0;94m'
G='\033[0;32m'
L='\033[38;5;135m'
RO='\e[38;5;205m'
NC='\033[0m'

node_number=$1

# Check if the input is a valid number
if [[ ! "$node_number" =~ ^[0-9]+$ ]]; then
    echo -e "${RO}Error: Invalid input. Please enter a valid number.${NC}"
    echo -e "${RO}A valid input should be a non-negative integer (e.g. 1, 2, 3).${NC}"
    exit 1
fi

VM_ID=${node_number}000

sudo qm set $VM_ID -delete ide2
sudo qm set $VM_ID -boot order=virtio0
sudo qm set $VM_ID -net0 model=virtio,bridge=vmbr0,firewall=0,macaddr=00:24:18:0A:${node_number}B:DE
sudo qm set $VM_ID -onboot 1
sudo qm start $VM_ID

echo -e "${G}Firewall ${L}$VM_ID ${G} has been set up successfully!
${C}Now open the console and configure manually.${NC}"


