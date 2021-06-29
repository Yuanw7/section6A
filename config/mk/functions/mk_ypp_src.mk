define mk_ypp_src
 if test "$(topdir)" != "$(prefix)" ; then cp -r $(topdir)/include/* include/ ; fi ; \
 for ldir in $$LIBS2DO; do \
   if test ! -d "$$XPATH/$$ldir" ; then mkdir -p "$$XPATH/$$ldir" ; fi ; \
   if [ "$(topdir)" != "$(prefix)" ] && [ -f $$VPATH/$$ldir/.objects ] ; then \
    cp $$VPATH/$$ldir/.objects $$XPATH/$$ldir ; \
   fi ; \
   ./sbin/compilation/helper.sh -d $$XPATH/$$ldir -t lib_ypp_$$ldir.a -o .objects -m l -- "$(xcpp) $$ADF" ; \
   cd $$XPATH/$$ldir ; $(MAKE) VPATH=$$VPATH/$$ldir lib || exit "$$?" ; cd ../../; \
 done
endef
