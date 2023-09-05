#!/bin/bash

# Threshold
Threshold_Cpu=40
Threshold_Mem=45
Threshold_Disk=40

bPassed=true

# Check CPU Threshold
current_cpu=$(top -n1 | grep 'Cpu' | awk '{print int($2)}')
echo $current_cpu
if((current_cpu>Threshold_Cpu));then
    echo 'CPU is running beyond the threshold'
    bPassed=false
fi

# Check Memory Threshold
current_mem=$(free | grep 'Mem' | awk '{print int($3/$2*100)}')
echo $current_mem
if((current_mem>Threshold_Mem));then
    echo 'Memory is running beyond the threshold'
    bPassed=false
fi

# Check Disk Threshold
current_disk=$(df / | tail -1 | awk '{print int($5)}')
echo $current_disk
if((current_disk>Threshold_Disk));then
    echo 'Disk is running beyond the threshold'
    bPassed=false
fi

# Reboot if any threshold is reached
if(("$bPassed"=false));then
    echo 'Rebooting started....'
    aws ec2 reboot-instances --instance-ids i-0e0ad7bd3401cbf54
fi