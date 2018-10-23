# OpenVAS Vulnerability Test
# $Id: deb_2671.nasl 9353 2018-04-06 07:14:20Z cfischer $
# Auto-generated from advisory DSA 2671-1 using nvtgen 1.0
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

tag_affected  = "request-tracker4 on Debian Linux";
tag_insight   = "Request Tracker (RT) is a ticketing system which
enables a group of people to intelligently and efficiently manage
tasks, issues, and requests submitted by a community of users. It
features web, email, and command-line interfaces (see the package
rt4-clients).";
tag_solution  = "For the stable distribution (wheezy), these problems have been fixed in
version 4.0.7-5+deb7u2.

For the testing distribution (jessie), these problems will be fixed
soon.

For the unstable distribution (sid), these problems have been fixed in
version 4.0.12-2.

We recommend that you upgrade your request-tracker4 packages.";
tag_summary   = "Multiple vulnerabilities have been discovered in Request Tracker, an
extensible trouble-ticket tracking system. The Common Vulnerabilities
and Exposures project identifies the following problems:

CVE-2012-4733 
A user with the ModifyTicket right can bypass the DeleteTicket right
or any custom lifecycle transition rights and thus modify ticket data
without authorization.

CVE-2013-3368 
The rt command line tool uses semi-predictable temporary files. A
malicious user can use this flaw to overwrite files with permissions
of the user running the rt command line tool.

CVE-2013-3369 
A malicious user who is allowed to see administration pages can run
arbitrary Mason components (without control of arguments), which may
have negative side-effects.

CVE-2013-3370 
Request Tracker allows direct requests to private callback
components, which could be used to exploit a Request Tracker
extension or a local callback which uses the arguments passed to it
insecurely.

CVE-2013-3371 
Request Tracker is vulnerable to cross-site scripting attacks via
attachment filenames.

CVE-2013-3372 
Dominic Hargreaves discovered that Request Tracker is vulnerable to
an HTTP header injection limited to the value of the
Content-Disposition header.

CVE-2013-3373 
Request Tracker is vulnerable to a MIME header injection in outgoing
email generated by Request Tracker.

Request Tracker stock templates are resolved by this update. But any
custom email templates should be updated to ensure that values
interpolated into mail headers do not contain newlines.

CVE-2013-3374 
Request Tracker is vulnerable to limited session re-use when using
the file-based session store, Apache::Session::File. However Request
Tracker's default session configuration only uses
Apache::Session::File when configured for Oracle databases.

This version of Request Tracker includes a database content upgrade. If
you are using a dbconfig-managed database, you will be offered the
choice of applying this automatically. Otherwise see the explanation in
/usr/share/doc/request-tracker4/NEWS.Debian.gz for the manual steps to
perform.

Please note that if you run request-tracker4 under the Apache web
server, you must stop and start Apache manually. The restart 
mechanism
is not recommended, especially when using mod_perl or any form of
persistent Perl process such as FastCGI or SpeedyCGI.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.892671");
    script_version("$Revision: 9353 $");
    script_cve_id("CVE-2013-3371", "CVE-2013-3369", "CVE-2013-3374", "CVE-2013-3368", "CVE-2013-3370", "CVE-2012-4733", "CVE-2013-3372", "CVE-2013-3373");
    script_name("Debian Security Advisory DSA 2671-1 (request-tracker4 - several vulnerabilities)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2013-05-22 00:00:00 +0200 (Wed, 22 May 2013)");
    script_tag(name: "cvss_base", value:"6.8");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2013/dsa-2671.html");


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
if ((res = isdpkgvuln(pkg:"request-tracker4", ver:"4.0.7-5+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-apache2", ver:"4.0.7-5+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-clients", ver:"4.0.7-5+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-db-mysql", ver:"4.0.7-5+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-db-postgresql", ver:"4.0.7-5+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-db-sqlite", ver:"4.0.7-5+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-fcgi", ver:"4.0.7-5+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
