.PHONY: all

all: install_packages symlink_files

install: install_homebrew install_packages change_shells symlink_files mac_settings
	@echo "Setup complete"

install_homebrew:
	@echo "========================================"
	@echo "Installing Homebrew"
	if [ -z "$$(command -v brew)" ]; then \
	  /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	fi
	@echo "========================================"

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
