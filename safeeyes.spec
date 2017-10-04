%global srcname SafeEyes
%global pkgname safeeyes
%global debug_package %{nil}
%global sum An utility to avoid asthenopia

Name:		python-safeeyes
Version:	%{_version}
Release:	%{_release}
Summary:	%{sum}

Group:		User Interface/X Hardware Support
License:	GPL v3.0
Source: 	https://github.com/slgobinath/%{srcname}/archive/v%{version}.tar.gz
#ExclusiveArch:	i386 x86_64

BuildRequires:	python3-devel
BuildRequires:	gtk3-devel
Requires:	libnotify
Requires:	libappindicator-gtk3
Requires:	python3-pyaudio
Requires:	python3-psutil
Requires:	python3-pip
Requires:	python3-pytz
Requires:	python3-xlib
Requires:	python3-babel
Requires:	python3-gobject

%description
An utility to avoid asthenopia

%package -n python3-%{pkgname}
Summary:	%{sum}
%{?python_provide:%python_provide python3-%{pkgname}}

%description -n python3-%{pkgname}
An utility to avoid asthenopia

%prep
%autosetup -n %{srcname}-%{version}

%build
ls -la
%py3_build

%install
%py3_install


%check
%{__python3} setup.py test

%post
gtk-update-icon-cache /usr/share/icons/hicolor

%files -n python3-%{pkgname}
%{python3_sitelib}/*
%{_bindir}/safeeyes
%{_datarootdir}/applications/safeeyes.desktop
%{_datarootdir}/icons/hicolor/*

