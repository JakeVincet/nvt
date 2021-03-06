# OpenVAS Vulnerability Test
# $Id: deb_3807.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3807-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703807");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2017-6009", "CVE-2017-6010", "CVE-2017-6011");
    script_name("Debian Security Advisory DSA 3807-1 (icoutils - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-03-12 00:00:00 +0100 (Sun, 12 Mar 2017)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3807.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "icoutils on Debian Linux");
        script_tag(name: "insight",   value: "Icoutils is a set of programs that deal with MS Windows icons and
cursors. Resources such as icons and cursors can be extracted from MS
Windows executable and library files with 'wrestool'. Conversion of
these files to and from PNG images is done with 'icotool'. 'extresso'
automates these tasks with the help of special resource scripts.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), these problems have been fixed in
version 0.31.0-2+deb8u3.

For the upcoming stable distribution (stretch), these problems have been
fixed in version 0.31.2-1.

For the unstable distribution (sid), these problems have been fixed in
version 0.31.2-1.

We recommend that you upgrade your icoutils packages.");
    script_tag(name: "summary",   value: "Multiple vulnerabilities were discovered in the icotool and wrestool
tools of Icoutils, a set of programs that deal with MS Windows icons and
cursors, which may result in denial of service or the execution of
arbitrary code if a malformed .ico or .exe file is processed.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"icoutils", ver:"0.31.0-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icoutils", ver:"0.31.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
