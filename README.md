# Docker based rapid developpement environnement

Inspired by docker-ubuntu-sahil.

This give me a rapid ubuntu dev environment, to quickly start new projects or test things in virtualized (docker container) env.

## Details of functionnalities :
1. Basic commands like sudo, curl, nano
2. Installs latest version of node on start
3. Installs ohmyzsh, the powerline fonts and powerline10k theme preconfigured
4. Git support
5. OpenJDK

## Usage
0. Ensure you have docker installed and running
1. Clone this repo
2. Open terminal and run, `chmod +x build.sh`
3. And run `chmod +x run.sh`
4. Run `./build.sh`
5. Run `./run.sh`

Easy! This should give you a linux prompt for a user called "devuser" with password "p@ssword1". This user is a sudoer.

## If you wish to change the zsh theme, 
1. cd ~
2. sudo chmod +x installthemes.sh
3. ./installthemes.sh
4. Edit your .zshrc, and change the theme (I like agnoster)
5. Optionally capture it using docker commit (see https://winsmarts.com/snapshot-a-docker-container-20df59bbd473)

## TODO
Things I want to add for futur use :
* add volume for working files (must run the container in ~/development directory for exemple, and will attach the ./ path to docker /home/devuser/development)

