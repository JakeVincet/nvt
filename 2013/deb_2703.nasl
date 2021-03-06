# OpenVAS Vulnerability Test
# $Id: deb_2703.nasl 9353 2018-04-06 07:14:20Z cfischer $
# Auto-generated from advisory DSA 2703-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
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

include("revisions-lib.inc");

tag_affected  = "subversion on Debian Linux";
tag_insight   = "Subversion, also known as svn, is a version control system much like
the Concurrent Versions System (CVS). Version control systems allow
many individuals (who may be distributed geographically) to
collaborate on a set of files (typically source code). Subversion has
all the major features of CVS, plus certain new features that CVS
users often wish they had.";
tag_solution  = "For the oldstable distribution (squeeze), these problems have been fixed in
version 1.6.12dfsg-7.

For the stable distribution (wheezy), these problems have been fixed in
version 1.6.17dfsg-4+deb7u3.

For the unstable distribution (sid), these problems will be fixed soon.

We recommend that you upgrade your subversion packages.";
tag_summary   = "Several vulnerabilities were discovered in Subversion, a version control
system. The Common Vulnerabilities and Exposures project identifies the
following problems:

CVE-2013-1968 
Subversion repositories with the FSFS repository data store format
can be corrupted by newline characters in filenames. A remote
attacker with a malicious client could use this flaw to disrupt the
service for other users using that repository.

CVE-2013-2112 
Subversion's svnserve server process may exit when an incoming TCP
connection is closed early in the connection process. A remote
attacker can cause svnserve to exit and thus deny service to users
of the server.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.892703");
    script_version("$Revision: 9353 $");
    script_cve_id("CVE-2013-1968", "CVE-2013-2112");
    script_name("Debian Security Advisory DSA 2703-1 (subversion - several vulnerabilities)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2013-06-09 00:00:00 +0200 (Sun, 09 Jun 2013)");
    script_tag(name: "cvss_base", value:"7.8");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");

    script_xref(name: "URL", value: "http://www.debian.org/security/2013/dsa-2703.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: tag_affected);
    script_tag(name: "insight",   value: tag_insight);
#    script_tag(name: "impact",    value: tag_impact);
    script_tag(name: "solution",  value: tag_solution);
    script_tag(name: "summary",   value: tag_summary);
    script_tag(name: "vuldetect", value: tag_vuldetect);
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");

    exit(0);
}

include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libapache2-svn", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-dev", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-doc", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-java", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-perl", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-ruby", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-ruby1.8", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn1", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-subversion", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"subversion", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"subversion-tools", ver:"1.6.12dfsg-7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libapache2-svn", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-dev", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-doc", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-java", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-perl", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-ruby", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn-ruby1.8", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsvn1", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-subversion", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"subversion", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"subversion-tools", ver:"1.6.17dfsg-4+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
