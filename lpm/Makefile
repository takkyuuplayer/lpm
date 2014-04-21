all:
	curl -O http://www.kasahara.ws/lpm/lpm
	carton install
	carton exec -- perl lpm initlocaldir
	carton exec -- perl lpm install compiler-envs
	exec $SHELL -l
	rm lpm
