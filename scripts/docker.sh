sudo sed -i 's|/swap|#/swap|' /etc/fstab
sudo sed -i 's|GRUB_CMDLINE_LINUX=""|GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"|' /etc/default/grub
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce=18.06.2~ce~3-0~ubuntu
sudo sh -c "echo '{\"exec-opts\":[\"native.cgroupdriver=systemd\"],\"log-driver\":\"json-file\",\"log-opts\":{\"max-size\":\"100m\"},\"storage-driver\":\"overlay2\"}' > /etc/docker/daemon.json"
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo usermod -aG docker $USER
sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl restart docker
