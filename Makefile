all:
	carton install
	curl -o /tmp/porg-0.2.tar.gz http://excellmedia.dl.sourceforge.net/project/porg/porg-0.2.tar.gz
	carton exec -- perl lpm initlocaldir --porgbase=/tmp/porg-0.2.tar.gz
	#carton exec -- perl lpm install compiler-envs

build-essential:
	carton exec -- perl lpm install http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.gz
	carton exec -- perl lpm install http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
	carton exec -- perl lpm install http://ftp.gnu.org/gnu/automake/automake-1.15.tar.gz
	carton exec -- perl lpm install scripts/libevent.lpm
	carton exec -- perl lpm install scripts/ncurses.lpm
	carton exec -- perl lpm install https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
