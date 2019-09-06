bin_PROGRAMS = learn

libexec_PROGRAMS = lcount tee.learn

# INCLUDES = -I.

learn_SOURCES = learn.c learn.h pathnames.h

learn.o: learn.c
	$(COMPILE) -c -DLIBEXECDIR="\"$(libexecdir)\"" \
	-DPKGDATADIR="\"$(pkgdatadir)\"" learn.c

lcount_SOURCES = lcount.c
	$(COMPILE) -c lcount.c

tee_learn_SOURCES = tee.learn.c
	$(COMPILE) -c tee.learn.c
