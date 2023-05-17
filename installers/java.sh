#!/bin/bash

sudo apt install -y default-jre
echo "" >> ~/.bashrc
echo "# Java" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> ~/.bashrc
source ~/.bashrc
