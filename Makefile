DIRS = udt src
TARGETS = all clean
DESTDIR ?= /usr/local

$(TARGETS): %: $(patsubst %, %.%, $(DIRS))

$(foreach TGT, $(TARGETS), $(patsubst %, %.$(TGT), $(DIRS))):
	$(MAKE) -C $(subst ., , $@)
	
install: all
	mkdir -p $(DESTDIR)/bin $(DESTDIR)/sbin $(DESTDIR)/share/doc/udr
	cp -a src/udr $(DESTDIR)/bin
	cp -a server/udrserver $(DESTDIR)/sbin
	cp -a server/udrd.conf.example $(DESTDIR)/share/doc/udr

