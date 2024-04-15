all: install

dep: up3rd
	sudo apt install zsh
	sudo apt install global
	sudo apt install tig
	sudo apt install lua5.3 
	sudo apt install fzf

up3r:
	git submodule add git@github.com:xm-tech/z.lua.git z.lua
	git submodule update --init --recursive

install: dep
	mkdir -p ~/.vim/plugin && \cp -rf $(PWD)/plugin/* ~/.vim/plugin/

	# [[ -f ~/.vimrc ]] || ln -s $(PWD)/vimrc ~/.vimrc
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
	# rm -f ~/.vimrc 
	rm -f ~/.zshrc
	rm -f ~/.tigrc
	rm -f ~/.gitconfig
	rm -f ~/.aliases.zsh
	rm -f ~/.funcs.zsh
	rm -f ~/.git.zsh
	rm -f ~/.z.lua
	rm -f ~/.clang-format

.PHONY: all dep up3rd clean install
