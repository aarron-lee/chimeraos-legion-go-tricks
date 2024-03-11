#!/bin/bash

cd $HOME/.local/bin/hhd

git pull

# disable hhd_dev if already running
sudo systemctl disable --now hhd_local.service
sudo systemctl disable --now hhd@$USER.service

./venv/bin/pip install -e .

# handle for SE linux
sudo chcon -u system_u -r object_r --type=bin_t /var/home/$(whoami)/.local/bin/hhd/venv/bin/hhd

sudo systemctl daemon-reload
sudo systemctl enable --now hhd_local.service
