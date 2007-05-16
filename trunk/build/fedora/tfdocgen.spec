Name: tfdocgen
Version: 1.00
Release: 1
Vendor: LPG (http://lpg.ticalc.org)
Packager: Kevin Kofler <Kevin@tigcc.ticalc.org>
Source: %{name}-%{version}.tar.bz2
Group: System Environment/Libraries
License: GPL
BuildRequires: glib2-devel
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Summary: TiLP Framework Documentation Generator
%description
The tfdocgen program is a program used by the libti*2 libraries to generate
their HTML documentation.

%prep
%setup

%build
CFLAGS="$RPM_OPT_FLAGS" ./configure --prefix=%{_prefix} --libdir=%{_libdir} --mandir=%{_mandir} --disable-nls
make

%install
if [ -d $RPM_BUILD_ROOT ]; then rm -rf $RPM_BUILD_ROOT; fi
mkdir -p $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-, root, root)
%{_bindir}/tfdocgen
%{_mandir}/man1/tfdocgen*
%doc COPYING
%doc AUTHORS
%doc NEWS
%doc README

%changelog
* Wed May 16 2007 Kevin Kofler <Kevin@tigcc.ticalc.org>
Drop -n tfdocgen, the tarball uses name-version format now.

* Thu May 3 2007 Kevin Kofler <Kevin@tigcc.ticalc.org>
First Fedora RPM.
