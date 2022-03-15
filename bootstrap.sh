#!/usr/bin/env bash

sudo apt-get update

# 移除旧的 docker 包
sudo apt-get remove -y docker docker-engine docker.io containerd runc

# 安装依赖
sudo apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https

# 导入 docker GPG key

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 添加 docker apt 仓库
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 更新索引
sudo apt-get update

# 安装 docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# 导入 Google Cloud GPG key
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# 添加 kubernetes apt 仓库
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# 再次更新包索引
sudo apt-get update

# 安装 kubelet、kubeadm 和 kubectl，并锁定其版本
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
