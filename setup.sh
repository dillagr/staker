#!/usr/bin/env bash
#
# NOTE: used to build a Linux masternode
#

## update Ubuntu
sudo apt-get -y update
sudo apt-get -y dist-upgrade

## additional Ubuntu packages
sudo apt-get -y install nano htop git \
	build-essential libtool autotools-dev \
	automake pkg-config libssl-dev libevent-dev \
	bsdmainutils software-properties-common \
	libboost-all-dev libzmq3-dev \
	libminiupnpc-dev libssl-dev libevent-dev
	
## external repo
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get -y update

## install addtl libraries
sudo apt-get -y install libdb4.8-dev libdb4.8++-dev

## uncomment line below to automatically download NYEX wallet
## (NOTE: version may change outside the scope of this script)
#wget https://github.com/nyerium-core/nyerium/releases/download/v1.0.1.0/nyerium-1.0.1.0-x64-linux-tar.gz
