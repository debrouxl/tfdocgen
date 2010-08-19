## Process this file with automake to produce Makefile.in

ACLOCAL_AMFLAGS=-I m4

bin_PROGRAMS = tfdocgen
tfdocgen_SOURCES = tfdocgen.c

tfdocgen_CPPFLAGS = @GLIB_CFLAGS@
tfdocgen_LDADD = @GLIB_LIBS@

man_MANS=tfdocgen.1
EXTRA_DIST = tfdocgen.dsp tfdocgen.dsw $(man_MANS)
