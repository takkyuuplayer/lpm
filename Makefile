ENV=$(shell which env)

all:
	carton install
	curl -o /tmp/porg-0.2.tar.gz http://excellmedia.dl.sourceforge.net/project/porg/porg-0.2.tar.gz
	carton exec -- perl lpm initlocaldir --porgbase=/tmp/porg-0.2.tar.gz
	@echo '"eval $$(make compiler-envs) carton exec -- lpm" can use local libs to compile'

compiler-envs:
	@echo "${ENV} LIBNCURSES_LIBS='-L${LPM_LIB} ${LIBNCURSES_LIBS}' LIBNCURSES_CFLAGS='-I${LPM_INCLUDE}/ncurses ${LIBNCURSES_CFLAGS}' LDFLAGS='-L${LPM_LIB} ${LDFLAGS}' CFLAGS='-I${LPM_INCLUDE} ${CFLAGS}' CCFLAGS='-I${LPM_INCLUDE} ${CCFLAGS}' CXXFLAGS='-I${LPM_INCLUDE} ${CXXFLAGS}'"
