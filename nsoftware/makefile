LINUX_HOST=nix
LINUX_USER=test
PROD=nsoftware# must be lowercase
SCRIPT=../../../../branches/v20/cnx/lib/static/unix_docker_test.sh
KEYFILE="C:\Users\reese\Desktop\nix_openssh_rsa_nopasswd"
DIR_TEST=/home/test/$(PROD)/

all: start

start:
	set CHERE_INVOKING=1
	\cygwin\bin\bash -l -c "make cygwin_start IMAGE=$(image)"

status:
	set CHERE_INVOKING=1
	\cygwin\bin\bash -l -c "make cygwin_status"

stop:
	set CHERE_INVOKING=1
	\cygwin\bin\bash -l -c "make cygwin_stop IMAGE=$(image)"

auth:
	set CHERE_INVOKING=1
	\cygwin\bin\bash -l -c "make cygwin_auth"

##############################################################
cygwin_auth:
	ssh-copy-id $(LINUX_USER)@$(LINUX_HOST)	

cygwin_start:
	#copy doker files and test.sh
	-ssh -i $(KEYFILE) $(LINUX_USER)@$(LINUX_HOST) "mkdir $(DIR_TEST)"
	rsync -rtuv --delete dockerfiles $(LINUX_USER)@$(LINUX_HOST):$(DIR_TEST)
	rsync -rtuv --delete dockerconfig $(LINUX_USER)@$(LINUX_HOST):$(DIR_TEST)
	rsync -rtuv --delete $(SCRIPT) $(LINUX_USER)@$(LINUX_HOST):$(DIR_TEST)
	ssh -i $(KEYFILE) $(LINUX_USER)@$(LINUX_HOST) "chmod -R 0777 $(DIR_TEST) && cd $(DIR_TEST) && ./unix_docker_test.sh start $(IMAGE)"

cygwin_status:
	-ssh -i $(KEYFILE) $(LINUX_USER)@$(LINUX_HOST) "mkdir $(DIR_TEST)"
	rsync -rtuv --delete $(SCRIPT) $(LINUX_USER)@$(LINUX_HOST):$(DIR_TEST)
	ssh -i $(KEYFILE) $(LINUX_USER)@$(LINUX_HOST) "chmod -R 0777 $(DIR_TEST) && cd $(DIR_TEST) && ./unix_docker_test.sh status"

cygwin_stop:
	-ssh -i $(KEYFILE) $(LINUX_USER)@$(LINUX_HOST) "mkdir $(DIR_TEST)"
	rsync -rtuv --delete $(SCRIPT) $(LINUX_USER)@$(LINUX_HOST):$(DIR_TEST)
	ssh -i $(KEYFILE) $(LINUX_USER)@$(LINUX_HOST) "chmod -R 0777 $(DIR_TEST) && cd $(DIR_TEST) && ./unix_docker_test.sh stop $(IMAGE)"

###############################################################

