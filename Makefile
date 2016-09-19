SUBDIRS := rsyslog postfix

build: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all clean $(SUBDIRS)
