Vagrant.configure("2") do |config|

  config.vm.box_check_update = false

	(10..11).each do |i|

		config.vm.define "node#{i}" do |node|

		# 设置虚拟机的Box
		node.vm.box = "ubuntu/bionic64"

		# 设置虚拟机的主机名
		node.vm.hostname="node#{i}"

		# 设置虚拟机的IP
		node.vm.network "private_network", ip: "192.168.68.#{i}"

		# 设置主机与虚拟机的共享目录
		# node.vm.synced_folder "~/Desktop/share", "/home/vagrant/share"

		# VirtaulBox相关配置
		node.vm.provider "virtualbox" do |v|

			# 设置虚拟机的名称
			v.name = "node#{i}"

			# 设置虚拟机的内存大小  
			v.memory = 4096

			# 设置虚拟机的CPU个数
			v.cpus = 2
		end

    # 设置启动脚本
    config.vm.provision :shell, path: "bootstrap.sh"

		end
	end
end