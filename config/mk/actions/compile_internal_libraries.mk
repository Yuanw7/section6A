qe_pseudo: 
	@$(call todo,qe_pseudo,lib/qe_pseudo,)
	@+LIBS2DO="qe_pseudo"; DIR2GO="lib" ; VPATH="$(compdir)/lib" ; $(mk_internal_lib)
slatec: 
	@$(call todo,slatec,lib/slatec,)
	@+LIBS2DO="slatec"; DIR2GO="lib" ; VPATH="$(compdir)/lib" ; $(mk_internal_lib)
math77:
	@$(call todo,math77,lib/math77,)
	@+LIBS2DO="math77"; DIR2GO="lib" ; VPATH="$(compdir)/lib" ; $(mk_internal_lib)
local:
	@$(call todo,local,lib/local,)
	@+LIBS2DO="local" ; DIR2GO="lib" ; VPATH="$(compdir)/lib" ; $(mk_internal_lib)
