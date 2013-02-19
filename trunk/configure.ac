dnl Process this file with autoconf to produce a configure script.

AC_INIT(tfdocgen, 1.00, [tilp-users@lists.sourceforge.net])
AM_INIT_AUTOMAKE([dist-bzip2])
AM_MAINTAINER_MODE
AC_CONFIG_MACRO_DIR([m4])

AC_CONFIG_HEADERS([config.h])
AC_PREFIX_DEFAULT(/usr/local)

AC_SUBST(VERSION)

ISODATE=`date +%Y-%m-%d`
AC_SUBST(ISODATE)

AC_CANONICAL_HOST

dnl Checks for programs.
AC_PROG_INSTALL
AC_PROG_CC
AM_PROG_CC_C_O
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
