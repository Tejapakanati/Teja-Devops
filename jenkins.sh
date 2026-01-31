sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo yum upgrade
sudo dnf install java-21-amazon-corretto -y
sudo dnf install jenkins -y
systemctl restart jenkins
