all:
	carton install
	curl -o /tmp/porg-0.2.tar.gz http://excellmedia.dl.sourceforge.net/project/porg/porg-0.2.tar.gz
	carton exec -- perl lpm initlocaldir --porgbase=/tmp/porg-0.2.tar.gz
	#carton exec -- perl lpm install compiler-envs
