/*
 * pathnames file for learn.
 * $OpenBSD: pathnames.h,v 1.1 1998/09/28 16:40:17 ian Exp $
 */

/*
 * Directory where the lcount and tee programs are installed, and
 * also the lessons.  This should be PKGDATADIR, which is specified
 * using the configure script and passed in through the Makefile.
 */

#ifdef PKGDATADIR

# define	_PATH_LLIB	PKGDATADIR

#else

# define	_PATH_LLIB	"/usr/share/learn"

#endif /* PKGDATADIR */
