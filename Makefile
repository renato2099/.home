# Makefile to install .home on the target system

# destination path
DEST_PATH = $(HOME)/.home

# files to delete from $HOME
DOT_FILES = $(HOME)/.latexmkrc $(HOME)/.vimrc $(HOME)/.vim $(HOME)/.clang-format $(HOME)/.tmux.conf

install: clean $(DOT_FILES) help
	
clean:
	rm -f $(DOT_FILES)
help:
	@echo "done"
	@echo 

$(HOME)/.clang-format:
	ln -s $(DEST_PATH)/clang-format $(HOME)/.clang-format

$(HOME)/.tmux.conf:
	ln -s $(DEST_PATH)/tmux.conf $(HOME)/.tmux.conf

# sym links
$(HOME)/.latexmkrc:
	ln -s $(DEST_PATH)/latexmkrc $(HOME)/.latexmkrc
$(HOME)/.vimrc:
	ln -s $(DEST_PATH)/.vimrc $(HOME)/.vimrc
$(HOME)/.vim:
	ln -s $(DEST_PATH)/.vim $(HOME)/.vim

