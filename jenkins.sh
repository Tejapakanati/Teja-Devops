sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo yum upgrade
sudo dnf install java-17-amazon-corretto -y
sudo dnf install jenkins -y
systemctl restart jenkins
sudo dnf install git -y

// error //
sudo mount -o remount,size=2G /tmp
df -h /tmp


//maven installation //
sudo dnf update -y
sudo dnf install maven -y



//if incase problme with start jenkins //

sudo systemctl daemon-reload
sudo systemctl restart jenkins
sudo systemctl status jenkins


//Nexus Setup//
sudo yum update -y
sudo yum install java-1.8.0-openjdk -y
sudo adduser nexus
cd /opt
wget https://download.sonatype.com/nexus/3/nexus-3.63.0-01-unix.tar.gz
tar -xvf nexus-3.63.0-01-unix.tar.gz
sudo mv nexus-3.63.0-01.* nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
vim /opt/nexus/bin/nexus.rc - run_as_user="nexus"
vim /etc/systemd/system/nexus.service
""""
[Unit]
Description=Nexus Repository Manager
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus

ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
Restart=on-abort

TimeoutSec=600

[Install]
WantedBy=multi-user.target
""""
sudo systemctl daemon-reload
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus
//nexus setup end//

//if jenkins goes offline withe gets error withe spaec //

sudo fallocate -l 2G /swapfile  // 🔹 Create 2GB swap file
sudo chmod 600 /swapfile  // sudo chmod 600 /swapfile
sudo mkswap /swapfile //🔹 Enable swap
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab  // 🔹 Make swap permanent (VERY IMPORTANT)

// clean disak space //
df -h /tmp
sudo rm -rf /tmp/*
df -h /tmp

// jenkins default  folder//
cd /var/lib/jenkins



