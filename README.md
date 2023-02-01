#VM configuration for Debian Buster on Virtual Box
#Iso : https://www.debian.org/releases/buster/debian-installer/ --> netinst CD image = amd64

su

sudo apt-get update
sudo apt-get install

sudo apt-get zsh
sudo apt-get git
sudo apt-get curl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ssh-keygen -t rsa -b 4096

#Install docker

sudo apt-get install \
ca-certificates \
curl \
gnupg \
lsb-release


sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

#if error 
#sudo chmod a+r /etc/apt/keyrings/docker.gpg
#sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world
