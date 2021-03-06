# OpenVAS Vulnerability Test
# $Id: deb_3369.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3369-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703369");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-5723");
    script_name("Debian Security Advisory DSA 3369-1 (zendframework - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-10-06 00:00:00 +0200 (Tue, 06 Oct 2015)");
    script_tag(name:"cvss_base", value:"7.2");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3369.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "zendframework on Debian Linux");
        script_tag(name: "insight",   value: "Extending the art & spirit of PHP, Zend Framework is based on simplicity,
object-oriented best practices, corporate friendly licensing, and a rigorously
tested agile codebase. Zend Framework is focused on building more secure,
reliable, and modern Web 2.0 applications & web services, and consuming widely
available APIs from leading vendors like Google, Amazon, Yahoo!, Flickr, as
well as API providers and cataloguers like StrikeIron and ProgrammableWeb.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy), this problem has been fixed
in version 1.11.13-1.1+deb7u4.

For the stable distribution (jessie), this problem has been fixed in
version 1.12.9+dfsg-2+deb8u4.

For the testing distribution (stretch), this problem has been fixed
in version 1.12.16+dfsg-1.

For the unstable distribution (sid), this problem has been fixed in
version 1.12.16+dfsg-1.

We recommend that you upgrade your zendframework packages.");
    script_tag(name: "summary",   value: "Multiple vulnerabilities were discovered in Zend Framework, a PHP
framework:

CVE-2015-5723 
It was discovered that due to incorrect permissions masks when
creating directories, local attackers could potentially execute
arbitrary code or escalate privileges.

ZF2015-08 (no CVE assigned)

Chris Kings-Lynne discovered an SQL injection vector caused by
missing null byte filtering in the MS SQL PDO backend, and a similar
issue was also found in the SQLite backend.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"zendframework", ver:"1.11.13-1.1+deb7u4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zendframework-bin", ver:"1.11.13-1.1+deb7u4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zendframework-resources", ver:"1.11.13-1.1+deb7u4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zendframework", ver:"1.12.16+dfsg-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zendframework-bin", ver:"1.12.16+dfsg-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zendframework-resources", ver:"1.12.16+dfsg-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zendframework", ver:"1.12.9+dfsg-2+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zendframework-bin", ver:"1.12.9+dfsg-2+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zendframework-resources", ver:"1.12.9+dfsg-2+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
