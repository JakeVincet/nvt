# OpenVAS Vulnerability Test
# $Id: deb_3651.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3651-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703651");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-6316");
    script_name("Debian Security Advisory DSA 3651-1 (rails - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-08-25 00:00:00 +0200 (Thu, 25 Aug 2016)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3651.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "rails on Debian Linux");
    script_tag(name: "insight",   value: "Rails is a full-stack, open-source web
framework in Ruby for writing real-world applications.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 2:4.1.8-1+deb8u4.

For the unstable distribution (sid), this problem has been fixed in
version 2:4.2.7.1-1.

We recommend that you upgrade your rails packages.");
    script_tag(name: "summary",   value: "Andrew Carpenter of Critical Juncture
discovered a cross-site scripting vulnerability affecting Action View in rails,
a web application framework written in Ruby. Text declared as HTML safe 
will not have quotes escaped when used as attribute values in tag helpers.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"rails", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-actionmailer", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-actionpack", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-actionview", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-activemodel", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-activerecord", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-activesupport", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-activesupport-2.3", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-rails", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-railties", ver:"2:4.1.8-1+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
