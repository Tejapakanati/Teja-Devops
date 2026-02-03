sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo yum upgrade
sudo dnf install java-17-amazon-corretto -y
sudo dnf install jenkins -y
systemctl restart jenkins
sudo dnf install git -y

//if incase problme with start jenkins //

sudo systemctl daemon-reload
sudo systemctl restart jenkins
sudo systemctl status jenkins


