DIRS = udt src
TARGETS = all clean
DESTDIR ?= /usr/local

$(TARGETS): %: $(patsubst %, %.%, $(DIRS))

$(foreach TGT, $(TARGETS), $(patsubst %, %.$(TGT), $(DIRS))):
	$(MAKE) -C $(subst ., , $@)
	
install: all
	mkdir -p $DESTDIR/bin
	cp -a src/udr $DESTDIR/bin
