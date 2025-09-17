#!/bin/bash

# Run this script as root
# add nibbler to sudoers
echo "nibbler ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
