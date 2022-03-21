.PHONY: all

all: install_packages symlink_files

install: install_homebrew install_packages modify_files symlink_files mac_settings
	@echo "Setup complete"

install_homebrew:
	@echo "========================================"
	@echo "Updating PATH"
	if [ ! -f ~/.zshrc ]; then \
		export PATH="/opt/homebrew/bin:$$PATH"; \
		echo 'export PATH="/opt/homebrew/bin:$$PATH"' >> $$HOME/.zshrc; \
		echo "Restart process"; \
		exec zsh; \
	fi
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

modify_files:
	@echo "========================================"
	@echo "Updating directories"
	if [ ! -d ~/.config ]; then \
	    mkdir -p ~/.config; \
	fi
	rm -rf ~/.zshrc
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
