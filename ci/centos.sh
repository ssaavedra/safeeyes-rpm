#!/bin/bash

yum install -y gcc rpm-build rpmdevtools make wget yum-utils --enablerepo=extras

cd /base-src

yum-builddep -y ./safeeyes.spec

chown `id -u`:`id -g` -R .

make
