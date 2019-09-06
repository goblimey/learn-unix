# Makefile is derived from Makefile.in (by autoconf) and that file is
# in turn derived from Makefile.am (by automake).
#
# In Makefile.am, EXTRA_DIST lists the files and directories that should
# be included in the distribution.  Nobase_dist_pkgdata should define the
# data to be installed, but I couldn't get it to work.  Specified the data
# installation by hand.  This has one entry for each course directory, so
# If you add extra courses, you must add extra entries here.

EXTRA_DIST = Linfo Xinfo files morefiles editor eqn macros

install-data-local:
	$(INSTALL_DATA) Linfo Xinfo $(DESTDIR)$(pkgdatadir); \
	$(INSTALL) -d $(DESTDIR)$(pkgdatadir)/editor; \
	$(INSTALL_DATA) editor/* $(DESTDIR)$(pkgdatadir)/editor; \
	$(INSTALL) -d $(DESTDIR)$(pkgdatadir)/eqn; \
	$(INSTALL_DATA) eqn/* $(DESTDIR)$(pkgdatadir)/eqn; \
	$(INSTALL) -d $(DESTDIR)$(pkgdatadir)/files; \
	$(INSTALL_DATA) files/* $(DESTDIR)$(pkgdatadir)/files; \
	$(INSTALL) -d $(DESTDIR)$(pkgdatadir)/macros; \
	$(INSTALL_DATA) macros/* $(DESTDIR)$(pkgdatadir)/macros; \
	$(INSTALL) -d $(DESTDIR)$(pkgdatadir)/morefiles; \
	$(INSTALL_DATA) morefiles/* $(DESTDIR)$(pkgdatadir)/morefiles;
