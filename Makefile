all: install

install:
	carton install
	curl -o /tmp/porg-0.2.tar.gz http://excellmedia.dl.sourceforge.net/project/porg/porg-0.2.tar.gz
	carton exec -- perl lpm initlocaldir --porgbase=/tmp/porg-0.2.tar.gz

build-essential:
	carton exec -- perl lpm install scripts/libevent.lpm
	carton exec -- perl lpm install scripts/ncurses.lpm
	carton exec -- perl lpm install https://cmake.org/files/v3.7/cmake-3.7.1.tar.gz
	carton exec -- perl lpm install http://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz
	@echo "run 'source <(make compiler-envs)' to let compiler to refer local lib directory."

compiler-envs:
	@echo export LDFLAGS='-L${LPM_LIB} ${LDFLAGS}'
	@echo export CFLAGS='-I${LPM_INCLUDE} ${CFLAGS}'
	@echo export CCFLAGS='-I${LPM_INCLUDE} ${CCFLAGS}'
	@echo export CXXFLAGS='-I${LPM_INCLUDE} ${CXXFLAGS}'
	@echo export LIBNCURSES_LIBS='-L${LPM_LIB} ${LIBNCURSES_LIBS}'
	@echo export LIBNCURSES_CFLAGS='-I${LPM_INCLUDE}/ncurses ${LIBNCURSES_CFLAGS}'

help:
	@cat Makefile

brew:
	@echo 'ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"' >/tmp/brew.sh
	which brew || ${SHELL} /tmp/brew.sh
	@rm /tmp/brew.sh
	brew bundle
	brew upgrade

brew_dump:
	rm -rf Brewfile
	brew bundle dump
