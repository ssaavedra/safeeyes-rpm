#!/bin/bash

dnf install -y rpm-build rpmdevtools python3-gobject-base python3-gobject gtk3-devel libappindicator-gtk3 libnotify make gcc wget 'dnf-command(builddep)'

cd /base-src

dnf builddep -y --spec ./safeeyes.spec

make
