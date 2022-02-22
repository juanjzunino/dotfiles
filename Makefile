.PHONY: all

all: install_packages symlink_files

install: install_packages change_shells symlink_files mac_settings
	@echo "Setup complete"

install_packages:
	@echo "========================================"
	@echo "Installing packages"
	brew bundle --file=~/dotfiles/Brewfile
	@echo "========================================"

change_shells:
	@echo "========================================"
	@echo "Adding shells"
	echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
	echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
	chsh -s $(shell which zsh)
	@echo "========================================"

symlink_files:
	@echo "========================================"
	@echo "Symlinking dotfiles"
	stow -vt ~/ -S home config bins python
	@echo "========================================"

mac_settings:
	@echo "========================================"
	source ~/dotfiles/macOS
	@echo "========================================"
