all: install

dep: 
	sudo apt install zsh
	sudo apt install global
	sudo apt install tig
	sudo apt install lua5.3 
	sudo apt install fzf
	sudo apt install cscope
	sudo apt install ripgrep
	sudo apt install universal-ctags
	sudo apt install -y nodejs npm
	sudo apt install axel
	sudo apt install gh
	sudo apt install net-tools

conf-node:
	npm config set registry https://registry.npm.taobao.org/

install-pyenv:
	curl https://pyenv.run | bash

#install-python: install-pyenv
install-python: 
	# sudo mkdir -p ~/.pyenv/cache
	# cd ~/.pyenv/cache
	# sudo axel -n 20 https://www.python.org/ftp/python/3.8.19/Python-3.8.19.tar.xz
	# pyenv install 3.8.19 -v
	sudo apt install python3
	sudo apt install python3-pip
	sudo apt install pipx
	sudo pipx install pygments
	sudo pipx ensurepath
	pipx ensurepath
vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

up-vim-plug:
	mkdir -p ~/.vim/plugin && \cp -rf $(PWD)/plugin/* ~/.vim/plugin/

up3rd:
	# git submodule add git@github.com:xm-tech/z.lua.git z.lua
	git submodule update --init --recursive

install:
	mkdir -p ~/.vim/plugin && \cp -rf $(PWD)/plugin/* ~/.vim/plugin/

	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig-xm-tech ~/.gitconfig
	[ -f ~/.aliases.zsh ] || ln -s $(PWD)/aliases.zsh ~/.aliases.zsh
	[ -f ~/.funcs.zsh ] || ln -s $(PWD)/funcs.zsh ~/.funcs.zsh
	[ -f ~/.git.zsh ] || ln -s $(PWD)/git.zsh ~/.git.zsh
	[ -f ~/.z.lua ] || ln -s $(PWD)/z.lua/z.lua ~/.z.lua
	[ -f ~/.clang-format ] || ln -s $(PWD)/clang-format ~/.clang-format

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.vimrc 
	rm -f ~/.zshrc
	rm -f ~/.tigrc
	rm -f ~/.gitconfig
	rm -f ~/.aliases.zsh
	rm -f ~/.funcs.zsh
	rm -f ~/.git.zsh
	rm -f ~/.z.lua
	rm -f ~/.clang-format
	rm -rf ~/.vim/plugin

.PHONY: all dep up3rd clean install
