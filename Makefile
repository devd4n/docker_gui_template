WORKDIR=$(shell pwd)
STORAGE=storage

all:
	@echo "make build:  creates a docker image (${img})"
	@echo "make run:    starts a docker Image"
	@echo "make runX11:    starts a docker Image"
	@echo "make shell:  opens a shell in the container"

build:
	ifdef img
		@docker rmi build -t ${img} .
	else
		@echo 'img= not defined'
	endif

run:
	ifdef img
		@docker run -ti --rm ${img}
	else
		@echo 'img= not defined'
	endif
	
runX11:
	ifdef img
		@chmod +x ./xephyrdocker
		./xephyrdocker : ${img}
	else
		@echo 'img= not defined'
	endif
  
shell:
	ifdef img
		@docker run -ti --rm ${img} /bin/bash
	else
		@echo 'img= not defined'
	endif

clean:
	ifdef img
		@docker rmi ${IMAGE}
	else
		@echo 'img= not defined'
	endif
