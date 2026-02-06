sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo yum upgrade
sudo dnf install java-17-amazon-corretto -y
sudo dnf install jenkins -y
systemctl restart jenkins
sudo dnf install git -y


//maven installation //
sudo dnf update -y
sudo dnf install maven -y



//if incase problme with start jenkins //

sudo systemctl daemon-reload
sudo systemctl restart jenkins
sudo systemctl status jenkins

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



