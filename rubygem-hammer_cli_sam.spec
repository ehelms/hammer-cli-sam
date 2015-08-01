%global gem_name hammer_cli_sam
%global confdir hammer

%if 0%{?rhel} < 7
%global gem_dir /usr/lib/ruby/gems/1.8
%endif

%global gem_instdir %{gem_dir}/gems/%{gem_name}-%{version}
Summary: SAM commands for Hammer
Name: rubygem-%{gem_name}
Version: 1.0.0
Release: 1%{?dist}
Group: Development/Languages
License: GPLv3
URL: http://github.com/Katello/hammer-cli-sam
Source0: %{gem_name}-%{version}.gem

%if !( 0%{?rhel} > 6 || 0%{?fedora} > 18 )
Requires: ruby(abi)
%endif
Requires: ruby(rubygems)
Requires: rubygem(hammer_cli) >= 0.1.1
BuildRequires: ruby(rubygems)
%if 0%{?fedora} || 0%{?rhel} > 6
BuildRequires: rubygems-devel
%endif
BuildRequires: ruby
BuildArch: noarch
Provides: rubygem(%{gem_name}) = %{version}

%description
Hammer-CLI-SAM is a Hammer module which provides connectivity to a SAM server.


%package doc
Summary: Documentation for %{name}
Group: Documentation
Requires: %{name} = %{version}-%{release}
BuildArch: noarch

%description doc
Documentation for %{name}

%prep
%setup -q -c -T
mkdir -p .%{gem_dir}
gem install --local --install-dir .%{gem_dir} \
            --force %{SOURCE0}

%install
mkdir -p %{buildroot}%{_sysconfdir}/%{confdir}/cli.modules.d
install -m 755 .%{gem_instdir}/config/sam.yml %{buildroot}%{_sysconfdir}/%{confdir}/cli.modules.d/sam.yml
mkdir -p %{buildroot}%{gem_dir}
cp -pa .%{gem_dir}/* \
        %{buildroot}%{gem_dir}/

%files
%dir %{gem_instdir}
%{gem_instdir}/
%config(noreplace) %{_sysconfdir}/%{confdir}/cli.modules.d/sam.yml
%exclude %{gem_dir}/cache/%{gem_name}-%{version}.gem
%{gem_dir}/specifications/%{gem_name}-%{version}.gemspec

%files doc
%doc %{gem_dir}/doc/%{gem_name}-%{version}

%changelog
* Wed Mar 04 2015 Adam Price <komidore64@gmail.com> 1.0.0-1
- new package built with tito

* Wed Dec 03 2014 Mike McCune - 0.0.1-1
- Initial package
