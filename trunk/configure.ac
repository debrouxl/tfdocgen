dnl Process this file with autoconf to produce a configure script.

AC_INIT(tfdocgen.c)
AM_INIT_AUTOMAKE(tfdocgen, 0.1.0)

dnl create a config.h file (Automake will add -DHAVE_CONFIG_H)
AM_CONFIG_HEADER(config.h)

AC_SUBST(VERSION)

ISODATE=`date +%Y-%m-%d`
AC_SUBST(ISODATE)

AC_CANONICAL_HOST

dnl Checks for programs.
AC_PROG_INSTALL
AC_PROG_CC
AC_LIBTOOL_WIN32_DLL
AC_PROG_LIBTOOL

dnl Checks for libraries.
PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.0.0)
AC_SUBST(GLIB_CFLAGS)
AC_SUBST(GLIB_LIBS)

dnl Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS(stdio.h string.h)
AC_CHECK_FUNC(fopen)

dnl Checks for typedefs, structures, and compiler characteristics.

dnl Checks for library functions.

AC_OUTPUT(Makefile)
