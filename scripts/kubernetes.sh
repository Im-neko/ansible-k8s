curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo add-apt-repository -y ppa:projectatomic/ppa
sudo sh -c "echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list"
sudo apt update
sudo apt install -y kubelet kubeadm kubectl libseccomp2 software-properties-common
sudo modprobe overlay
sudo modprobe br_netfilter
sudo sh -c 'echo "net.bridge.bridge-nf-call-iptables = 1\nnet.ipv4.ip_forward = 1\nnet.bridge.bridge-nf-call-ip6tables = 1" > /etc/sysctl.d/99-kubernetes-cri.conf'
sudo sysctl --system
sudo systemctl daemon-reload
sudo systemctl enable kubelet
sudo systemctl restart kubelet
