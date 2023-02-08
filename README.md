VM configuration for Debian Buster on Virtual Box  
Iso link : https://www.debian.org/releases/buster/debian-installer/ take the netinst CD image amd64  
  
su  
  
sudo apt-get update  
sudo apt-get upgrade  
  
sudo apt-get install zsh  
sudo apt-get install git  
sudo apt-get install curl  
  
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  
  
ssh-keygen -t rsa -b 4096  
  
#Install docker  
  
sudo apt-get install \  
ca-certificates \  
curl \  
gnupg \  
lsb-release \  
make  
  
  
sudo mkdir -p /etc/apt/keyrings  
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg  

echo \  
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \  
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null  
  
sudo apt-get update  
  
if the last command return an error do :  
{  
  sudo chmod a+r /etc/apt/keyrings/docker.gpg  
  sudo apt-get update  
}  
  
Then finish the instalation with :  
  
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin  
sudo docker run hello-world  
  
In /etc/hosts add the line : 127.0.1.1  \<login\>.42.fr \<login\>
