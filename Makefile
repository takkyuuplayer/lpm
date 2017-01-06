all: install

install:
	carton install
	curl -o /tmp/porg-0.2.tar.gz http://excellmedia.dl.sourceforge.net/project/porg/porg-0.2.tar.gz
	carton exec -- perl lpm initlocaldir --porgbase=/tmp/porg-0.2.tar.gz

build-essential:
	carton exec -- perl lpm install scripts/libevent.lpm
	carton exec -- perl lpm install scripts/ncurses.lpm
	@echo run "source <(make compiler-envs)" to let compiler to refer local lib directory.

compiler-envs:
	@echo export LDFLAGS='-L${LPM_LIB} ${LDFLAGS}'
	@echo export CFLAGS='-I${LPM_INCLUDE} ${CFLAGS}'
	@echo export CCFLAGS='-I${LPM_INCLUDE} ${CCFLAGS}'
	@echo export CXXFLAGS='-I${LPM_INCLUDE} ${CXXFLAGS}'
	@echo export LIBNCURSES_LIBS='-L${LPM_LIB} ${LIBNCURSES_LIBS}'
	@echo export LIBNCURSES_CFLAGS='-I${LPM_INCLUDE}/ncurses ${LIBNCURSES_CFLAGS}'

help:
	@cat Makefile
