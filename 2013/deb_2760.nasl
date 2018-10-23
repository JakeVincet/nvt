# OpenVAS Vulnerability Test
# $Id: deb_2760.nasl 9353 2018-04-06 07:14:20Z cfischer $
# Auto-generated from advisory DSA 2760-1 using nvtgen 1.0
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

tag_affected  = "chrony on Debian Linux";
tag_insight   = "It consists of a pair of programs :
`chronyd'. This is a daemon which runs in background on the system. It
obtains measurements (e.g. via the network) of the system's offset
relative to other systems, and adjusts the system time accordingly. For
isolated systems, the user can periodically enter the correct time by hand
(using `chronyc'). In either case, `chronyd' determines the rate at which
the computer gains or loses time, and compensates for this. Chronyd
implements the NTP protocol and can act as either a client or a server.
`chronyc'. This is a command-line driven control and monitoring program.
An administrator can use this to fine-tune various parameters within the
daemon, add or delete servers etc whilst the daemon is running.";
tag_solution  = "For the oldstable distribution (squeeze), these problems will be fixed
soon in 1.24-3+squeeze1 (due to a technical restriction in the archive
processing scripts the two updates cannot be released together).

For the stable distribution (wheezy), these problems have been fixed in
version 1.24-3.1+deb7u2.

For the unstable distribution (sid), these problems will be fixed soon.

We recommend that you upgrade your chrony packages.";
tag_summary   = "Florian Weimer discovered two security problems in the Chrony time
synchronisation software (buffer overflows and use of uninitialised data
in command replies).";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.892760");
    script_version("$Revision: 9353 $");
    script_cve_id("CVE-2012-4502", "CVE-2012-4503");
    script_name("Debian Security Advisory DSA 2760-1 (chrony - several vulnerabilities)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2013-09-18 00:00:00 +0200 (Wed, 18 Sep 2013)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2013/dsa-2760.html");


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
if ((res = isdpkgvuln(pkg:"chrony", ver:"1.24-3.1+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
