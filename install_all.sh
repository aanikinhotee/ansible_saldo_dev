#!/bin/bash

ansible-playbook -i hosts install.yaml

ansible-playbook -i hosts install-buildtools.yaml

ansible-playbook -i hosts install-containers.yaml