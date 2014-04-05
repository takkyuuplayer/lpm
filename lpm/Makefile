all:
	curl -O http://www.kasahara.ws/lpm/lpm
	carton install
	carton exec -- perl lpm initlocaldir
	carton exec -- lpm install compiler-envs
