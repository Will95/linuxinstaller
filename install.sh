# Update debian
apt-get update -q
apt-get upgrade -q
apt-get dist-upgrade -q

# Install X & LXDE & VNC
apt-get -q -y install xorg lxde-core tightvncserver

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

#Install java8
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get install -q -y oracle-java8-installer

#Make java8 default
apt-get install -q -y oracle-java8-set-default

# Create vnc and ask password
tightvncserver :1
tightvncserver -kill :1

#Download osbot
curl -k -o ~/Desktop/osbot.jar https://osbot.org/mvc/get
chmod +x ~/Desktop/osbot.jar

#Download tribot
curl -k -o ~/Desktop/tribot.jar https://tribot.org/bin/TRiBot_Loader.jar
chmod +x ~/Desktop/tribot.jar

#Download osbuddy
curl -k -o ~/Desktop/OSBuddy.jar http://cdn.rsbuddy.com/live/f/loader/OSBuddy.jar
chmod +x ~/Desktop/OSBuddy.jar

#install osbot update script
wget http://madscripts.me/linuxinstallers/vnc-debian7/updateandstart.sh -O ~/Desktop/updateandstart.sh
chmod +x ~/Desktop/updateandstart.sh

#Add config
wget http://madscripts.me/linuxinstallers/vnc-debian7/xstartup -O ~/.vnc/xstartup

#boot vnc
tightvncserver :1
