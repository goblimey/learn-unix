# Process this file with autoconf to produce a configure script.
AC_INIT(learn, 2.0, learnbugs@merrowinternet.com)
AM_INIT_AUTOMAKE(learn, 2.0)
AC_CONFIG_SRCDIR(src)
AM_CONFIG_HEADER(src/config.h)
# AC_CONFIG_HEADER([config.h])

# required by automake

AC_PROG_MAKE_SET

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([fcntl.h stdlib.h string.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_PID_T

# Checks for library functions.
AC_FUNC_FORK
AC_FUNC_MALLOC
AC_TYPE_SIGNAL
AC_CHECK_FUNCS([mkdir strdup])

AC_OUTPUT(Makefile src/Makefile lib/Makefile man/Makefile)
AC_CONFIG_FILES([])
