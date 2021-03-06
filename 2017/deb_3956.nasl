###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3956.nasl 7088 2017-09-11 05:01:45Z asteins $
#
# Auto-generated from advisory DSA 3956-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.703956");
  script_version("$Revision: 7088 $");
  script_cve_id("CVE-2017-12865");
  script_name("Debian Security Advisory DSA 3956-1 (connman - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-09-11 07:01:45 +0200 (Mon, 11 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-08-27 00:00:00 +0200 (Sun, 27 Aug 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3956.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"connman on Debian Linux");
  script_tag(name:"insight", value:"The Linux Connection Manager project provides a daemon for managing
Internet connections within embedded devices running the Linux
operating system. The Connection Manager is designed to be slim and to
use as few resources as possible. It is fully modular system that
can be extended through plug-ins. The plug-in approach allows for
easy adaption and modification for various use cases.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.21-1.2+deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 1.33-3+deb9u1.

For the testing distribution (buster), this problem has been fixed
in version 1.33-3+deb9u1.

For the unstable distribution (sid), this problem has been fixed in
version 1.35-1.

We recommend that you upgrade your connman packages.");
  script_tag(name:"summary",  value:"Security consultants in NRI Secure Technologies discovered a stack
overflow vulnerability in ConnMan, a network manager for embedded
devices. An attacker with control of the DNS responses to the DNS proxy
in ConnMan might crash the service and, in same cases, remotely execute
arbitrary commands in the host running the service.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"connman", ver:"1.33-3+deb9u1", rls_regex:"DEB10.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman-dev", ver:"1.33-3+deb9u1", rls_regex:"DEB10.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman-doc", ver:"1.33-3+deb9u1", rls_regex:"DEB10.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman-vpn", ver:"1.33-3+deb9u1", rls_regex:"DEB10.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman", ver:"1.33-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman-dev", ver:"1.33-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman-doc", ver:"1.33-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman-vpn", ver:"1.33-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman", ver:"1.21-1.2+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman-dev", ver:"1.21-1.2+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman-doc", ver:"1.21-1.2+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"connman-vpn", ver:"1.21-1.2+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
