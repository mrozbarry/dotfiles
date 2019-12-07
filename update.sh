#!/bin/bash

git pull origin master
git submodule update --init --recursive
nvim +UpdateRemotePlugins +PlugInstall +PlugUpdate +PlugClean +qall
