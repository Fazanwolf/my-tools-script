# Variables

## Links

DISCORD_LINK	=	"https://discord.com/api/download?platform=linux&format=deb"

TEAMS_LINK	=	"https://go.microsoft.com/fwlink/p/?LinkID=2112886&clcid=0x409&culture=en-us&country=US"

JETBRAIN_LINK	=	"https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.25.12627.tar.gz"

COMPASS_LINK	=	"https://downloads.mongodb.com/compass/mongodb-compass_1.33.0_amd64.deb"

HEROKU_LINK	=	"https://cli-assets.heroku.com/install-ubuntu.sh"

NVM_LINK	=	"https://raw.githubusercontent.com/creationix/nvm/master/install.sh"

DOCKER_LINK	=	"https://get.docker.com"

GIMP_LINK	=	"https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref"

POSTMAN_LINK	=	"https://dl.pstmn.io/download/latest/linux64"

FEDORA_DUMP_LINK	=	"https://github.com/Epitech-Reunion/dump.git"

UBUNTU_DUMP_LINK	=	"https://github.com/kayofeld/script-installation-ordinateur-epitech.git"

CHROME_LINK	=	"https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

FIREFOX_LINK	=	"https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=fr"

VSCODE_LINK	=	"https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

## Functional

UNCOMPRESSED	=	tar -xvf
RM	=	rm -rf
LINE-BREAK	=	echo "---------------------------------"

## Extra

POSTMAN_ICON	=	"[Desktop Entry]<br>Encoding=UTF-8<br>Name=Postman<br>Exec=/opt/Postman/app/Postman %U<br>Icon=/opt/Postman/app/resources/app/assets/icon.png<br>Terminal=false<br>Type=Application<br>Categories=Development;"


# Rules

update:
	@apt update -y
	@apt upgrade -y

basic-tools:
	@apt install -y git curl wget

dev-requirement: update basic-tools
	@apt install -y build-essential libssl-dev zip unzip python3 python3-pip default-jdk ruby-full lua5.3

## Installations

# WEB ---------------------------------------

chromium:
	@$(LINE-BREAK)
	@echo "Chromium: Downloading..."
	@apt install chromium -y
	@echo "Chromium: Cleaning..."
	@$(RM) /tmp/chromium.deb
	@echo "Chromium: Done!"

chrome:
	@$(LINE-BREAK)
	@echo "Chrome: Downloading..."
	@$(RM) /tmp/chrome.deb
	@wget $(CHROME_LINK) -O /tmp/chrome.deb
	@echo "Chrome: Installing..."
	@dpkg -i /tmp/chrome.deb
	@echo "Chrome: Cleaning..."
	@$(RM) /tmp/chrome.deb
	@echo "Chrome: Done!"

firefox:
	@$(LINE-BREAK)
	@echo "Firefox: Downloading..."
	@$(RM) /tmp/firefox.deb
	@wget $(FIREFOX_LINK) -O /tmp/firefox.deb
	@echo "Firefox: Installing..."
	@dpkg -i /tmp/firefox.deb
	@echo "Firefox: Cleaning..."
	@$(RM) /tmp/firefox.deb
	@echo "Firefox: Done!"

# Social -----------------------------------------

discord:
	@$(LINE-BREAK)
	@echo "Discord: Downloading..."
	@$(RM) /tmp/discord.deb
	@wget $(DISCORD_LINK) -O /tmp/discord.deb
	@echo "Discord: Installing..."
	@dpkg -i /tmp/discord.deb
	@echo "Discord: Cleaning..."
	@$(RM) /tmp/discord.deb
	@echo "Discord: Done!"

teams:
	@$(LINE-BREAK)
	@echo "Teams: Downloading..."
	@$(RM) /tmp/teams.deb
	@wget $(TEAMS_LINK) -O /tmp/teams.deb
	@echo "Teams: Installing"
	@dpkg -i /tmp/teams.deb
	@echo "Teams: Cleaning..."
	@$(RM) /tmp/teams.deb
	@echo "Teams: Done!"

# IDE --------------------------------------------

vscode:
	@$(LINE-BREAK)
	@echo "Vscode: Downloading..."
	@$(RM) /tmp/vscode.deb
	@wget $(VSCODE_LINK) -O /tmp/vscode.deb
	@echo "Vscode: Installing..."
	@dpkg -i /tmp/vscode.deb
	@echo "Vscode: Cleaning..."
	@$(RM) /tmp/vscode.deb
	@echo "Vscode: Done!"

jetbrain:
	@$(LINE-BREAK)
	@echo "JetBrain: Downloading..."
	@$(RM) /tmp/jetbrain.tar.gz
	@wget $(JETBRAIN_LINK) -O /tmp/jetbrain.tar.gz
	@tar -xvf /tmp/jetbrain.tar.gz -C ~/Documents

# Development ---------------------------------------

# Web Tools -----------------------------------------

postman:
	@$(LINE-BREAK)
	@echo "Postman: Downloading..."
	@$(RM) /tmp/postman.tar.gz
	@wget $(POSTMAN_LINK) -O /tmp/postman.tar.gz
	@echo "Postman: Decompression..."
	@tar -xzf /tmp/postman-linux-x64.tar.gz -C /opt
	@echo "Postman: Linking..."
	@ln -s /opt/Postman/Postman /usr/bin/postman
	@echo "Postman: Setting..."
	@echo $(POSTMAN_ICON) > ~/.local/share/applications/Postman.desktop
	@echo "Postman: Cleaning..."
	@echo "Postman: Done!"

compass:
	@$(LINE-BREAK)
	@echo "MongoDBCompass: Downloading..."
	@$(RM) /tmp/MongoDBCompass.deb
	@wget $(COMPASS_LINK) -O /tmp/MongoDBCompass.deb
	@echo "MongoDBCompass: Installing..."
	@dpkg -i /tmp/MongoDBCompass.deb
	@echo "MongoDBCompass: Cleaning..."
	@$(RM) /tmp/MongoDBCompass.deb
	@echo "MongoDBCompass: Done!"

# Dump ------------------------------------------

dump-ubuntu:
	@$(LINE_BREAK)
	@$(RM) /tmp/dump
	@git clone $(UBUNTU_DUMP_LINK) /tmp/dump
	@echo "Execute: sudo /tmp/dump/installation/install.sh <prenom.nom@epitech.eu"

dump-fedora:
	@$(LINE_BREAK)
	@$(RM) /tmp/dump
	@git clone $(FEDORA_DUMP_LINK) /tmp/dump
	@chmod +x /tmp/dump/install_packages_dump.sh
	@echo "Execute: sudo /tmp/dump/install_packages_dump.sh"

nvidia-driver:
	@$(LINE_BREAK)
	@apt install nvidia-driver-510 nvidia-dkms-510

nvm:
	@$(LINE_BREAK)
	@curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
	@source ~/.profile && nvm install 12
	@source ~/.profile && nvm install 17

docker:
	@$(LINE_BREAK)
	@sudo apt install -y docker.io docker-compose
	@sudo groupadd -f docker
	@sudo usermod -aG docker ${USER}
	@newgrp docker

dbuild: dclean
	@docker build . -t test-script:v1

drun:
	@docker run -it test-script:v1 /bin/bash
	

dclean:
	@echo "Container:"
	@docker container prune --force
	@echo
	@echo "Image:"
	@docker image prune --force

test:
	@echo "UwU"

# apt-get install cmake
# apt-get install ruby
# apt-get install gradle
