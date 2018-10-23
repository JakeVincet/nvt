# OpenVAS Vulnerability Test
# $Id: deb_3424.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3424-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.703424");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-5343");
    script_name("Debian Security Advisory DSA 3424-1 (subversion - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-12-16 00:00:00 +0100 (Wed, 16 Dec 2015)");
    script_tag(name:"cvss_base", value:"8.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3424.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "subversion on Debian Linux");
    script_tag(name: "insight",   value: "Apache Subversion, also known as svn,
is a centralised version control system. Version control systems allow many
individuals (who may be distributed geographically) to collaborate on a set of
files (source code, websites, etc). Subversion began with a CVS paradigm and
supports all the major features of CVS, but has evolved to support
many features that CVS users often wish they had.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 1.8.10-6+deb8u2.

For the unstable distribution (sid), this problem has been fixed in
version 1.9.3-1.

We recommend that you upgrade your subversion packages.");
    script_tag(name: "summary",   value: "Ivan Zhakov discovered an integer
overflow in mod_dav_svn, which allows an attacker with write access to the
server to execute arbitrary code or cause a denial of service.

The oldstable distribution (wheezy) is not affected.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libapache2-mod-svn", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libapache2-svn", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-dev", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-doc", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-java", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-perl", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-ruby1.8", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn1:amd64", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn1:i386", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-subversion", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-svn:amd64", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-svn:i386", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"subversion", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"subversion-dbg", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"subversion-tools", ver:"1.8.10-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
