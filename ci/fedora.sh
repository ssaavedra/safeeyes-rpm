#!/bin/bash

dnf install -y rpm-build rpmdevtools make gcc wget 'dnf-command(builddep)'

cd /base-src

dnf builddep -y --spec ./safeeyes.spec

make
