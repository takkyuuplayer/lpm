all:
	carton install
	carton exec -- perl lpm initlocaldir
	carton exec -- perl lpm install compiler-envs
