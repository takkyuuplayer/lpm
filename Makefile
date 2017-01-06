all:
	carton install
	curl -o /tmp/porg-0.2.tar.gz http://excellmedia.dl.sourceforge.net/project/porg/porg-0.2.tar.gz
	carton exec -- perl lpm initlocaldir --porgbase=/tmp/porg-0.2.tar.gz
	@echo 'run "eval $$(make compiler-envs)" to let compilers to refer to the library directory under ${LPM__LOCAL}'

compiler-envs:
	@echo export LIBNCURSES_LIBS='-L${LPM_LIB} ${LIBNCURSES_LIBS}'
	@echo export LIBNCURSES_CFLAGS='-I${LPM_INCLUDE}/ncurses ${LIBNCURSES_CFLAGS}'
	@echo export LDFLAGS='-L${LPM_LIB} ${LDFLAGS}'
	@echo export CFLAGS='-I${LPM_INCLUDE} ${CFLAGS}'
	@echo export CCFLAGS='-I${LPM_INCLUDE} ${CCFLAGS}'
	@echo export CXXFLAGS='-I${LPM_INCLUDE} ${CXXFLAGS}'
