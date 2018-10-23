# OpenVAS Vulnerability Test
# $Id: deb_3655.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3655-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703655");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-6265", "CVE-2016-6525");
    script_name("Debian Security Advisory DSA 3655-1 (mupdf - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-08-26 00:00:00 +0200 (Fri, 26 Aug 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3655.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "mupdf on Debian Linux");
    script_tag(name: "insight",   value: "MuPDF is a lightweight PDF viewer
and toolkit written in portable C.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 1.5-1+deb8u1.

We recommend that you upgrade your mupdf packages.");
    script_tag(name: "summary",   value: "Two vulnerabilities were discovered
in MuPDF, a lightweight PDF viewer. The Common Vulnerabilities and Exposures
project identifies the following problems:

CVE-2016-6265 
Marco Grassi discovered a use-after-free vulnerability in MuPDF. An
attacker can take advantage of this flaw to cause an application
crash (denial-of-service), or potentially to execute arbitrary code
with the privileges of the user running MuPDF, if a specially
crafted PDF file is processed.

CVE-2016-6525 
Yu Hong and Zheng Jihong discovered a heap overflow vulnerability
within the pdf_load_mesh_params function, allowing an attacker to
cause an application crash (denial-of-service), or potentially to
execute arbitrary code with the privileges of the user running
MuPDF, if a specially crafted PDF file is processed.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libmupdf-dev", ver:"1.5-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mupdf", ver:"1.5-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mupdf-tools", ver:"1.5-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
