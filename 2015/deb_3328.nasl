# OpenVAS Vulnerability Test
# $Id: deb_3328.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3328-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703328");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-3429", "CVE-2015-5622", "CVE-2015-5623");
    script_name("Debian Security Advisory DSA 3328-1 (wordpress - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-08-04 00:00:00 +0200 (Tue, 04 Aug 2015)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3328.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "wordpress on Debian Linux");
        script_tag(name: "insight",   value: "WordPress is a full featured web blogging tool:

* Instant publishing (no rebuilding)
* Comment pingback support with spam protection
* Non-crufty URLs
* Themable
* Plugin support");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), these problems have been fixed in
version 4.1+dfsg-1+deb8u2.

For the unstable distribution (sid), these problems have been fixed in
version 4.2.3+dfsg-1.

We recommend that you upgrade your wordpress packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities have been found in Wordpress, the popular
blogging engine.

CVE-2015-3429 
The file example.html in the Genericicons icon font package and
twentyfifteen Wordpress theme allowed for cross site scripting.

CVE-2015-5622 
The robustness of the shortcodes HTML tags filter has been
improved. The parsing is a bit more strict, which may affect
your installation.

CVE-2015-5623 
A cross site scripting vulnerability allowed users with the
Contributor or Author role to elevate their privileges.

The oldstable distribution (wheezy) is only affected by CVE-2015-5622 
.
This less critical issue will be fixed at a later time.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"wordpress", ver:"4.1+dfsg-1+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wordpress-l10n", ver:"4.1+dfsg-1+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wordpress-theme-twentyfifteen", ver:"4.1+dfsg-1+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wordpress-theme-twentyfourteen", ver:"4.1+dfsg-1+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wordpress-theme-twentythirteen", ver:"4.1+dfsg-1+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
