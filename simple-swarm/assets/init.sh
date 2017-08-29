#!/bin/bash

echo "create database simple" | mysql -u root -psimple123 

echo "grant all privileges on simple.* to 'simple'@'%' identified by 'simple' with grant option;flush privileges;" | mysql -u root -psimple123 