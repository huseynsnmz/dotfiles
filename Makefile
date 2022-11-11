get:
	cp $(HOME)/.bashrc .
	cp -r $(HOME)/.config/zellij .
	cp -r $(HOME)/.config/nvim .

install:
	cp -u ./.bashrc $(HOME)/.bashrc
	cp -r ./zellij $(HOME)/.config
	cp -r ./nvim $(HOME)/.config

clean:
	rm -f .bashrc
	rm -rf zellij nvim

first:
	dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-36.noarch.rpm
	dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-36.noarch.rpm
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	dnf install -y mtr tmux sysstat btop toolbox zellij wireguard-tools sshuttle wireshark nmap bash-completion
