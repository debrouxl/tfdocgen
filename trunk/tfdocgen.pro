#
# Template
#

TEMPLATE	= app
LANGUAGE	= C

CONFIG -= qt
CONFIG	+= warn_on debug

SOURCES	+= tfdocgen.c

QMAKE_PROJECT_DEPTH=1

unix:OBJECTS_DIR = .obj

#
# Dependancies and Version checking
#

GLIB2_MINVERSION = 2.6.0
HAVE_GLIB2 = $$system(pkg-config --atleast-version=$$GLIB2_MINVERSION glib-2.0 && echo yes || echo no)
!equals(HAVE_GLIB2,yes):error(glib2 $$GLIB2_MINVERSION or higher required.)
PKGCONFIG_CFLAGS += $$system(pkg-config --cflags glib-2.0)
LIBS += $$system(pkg-config --libs glib-2.0)

#
# Path settings
#

PREFIX = $$(PREFIX)
isEmpty(PREFIX) {
  PREFIX = /usr/local
}

target.path = $$PREFIX/bin

man.path = $$PREFIX/share/man/man1
man.files = tfdocgen.1

INSTALLS += man target

#
# Various flags
#

VERSION = 1.00
PACKAGE = tfdocgen

LIBS	+= -Wl,--export-dynamic

isEmpty(CFLAGS) {
  debug {
    CFLAGS = -Os -g
  } else {
    CFLAGS = -Os -s -fomit-frame-pointer
  }
}
QMAKE_CFLAGS_DEBUG = $$CFLAGS $$PKGCONFIG_CFLAGS -DVERSION='"$$VERSION"'
QMAKE_CFLAGS_RELEASE = $$CFLAGS $$PKGCONFIG_CFLAGS -DVERSION='"$$VERSION"'

QMAKE_LFLAGS_RELEASE = -s

#
# Distribution
#

DISTFILES += $${man.files} Makefile tfdocgen.dsp tfdocgen.dsw \
	AUTHORS ChangeLog COPYING INSTALL README*

distbz2.target = dist-bzip2
distbz2.commands = zcat gfm.tar.gz | bzip2 --best -c > gfm.tar.bz2
distbz2.depends = dist

QMAKE_EXTRA_UNIX_TARGETS += distbz2
