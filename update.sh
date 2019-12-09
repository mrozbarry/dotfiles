#!/bin/bash

git pull origin master
git submodule update --init --recursive
nvim +UpdateRemotePlugins +PlugUpgrade +PlugInstall +PlugUpdate +PlugClean +qall
