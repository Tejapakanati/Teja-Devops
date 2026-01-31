sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo yum upgrade
sudo dnf install java-11-amazon-corretto java-11-amazon-corretto-devel -y
sudo dnf install jenkins -y
systemctl restart jenkins
