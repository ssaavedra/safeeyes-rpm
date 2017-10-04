#!/bin/bash

yum install -y gcc rpm-build rpmdevtools python3-gobject-base python3-gobject gtk3-devel libappindicator-gtk3 libnotify make wget yum-utils --enablerepo=extras

cd /base-src

yum-builddep -y ./safeeyes.spec

chown `id -u`:`id -g` -R .

make
