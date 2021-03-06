###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1521.nasl 11644 2018-09-27 08:04:59Z cfischer $
#
# Auto-generated from advisory DLA 1521-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.891521");
  script_version("$Revision: 11644 $");
  script_cve_id("CVE-2018-16586", "CVE-2018-16587");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1521-1] otrs2 security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 10:04:59 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-27 00:00:00 +0200 (Thu, 27 Sep 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/09/msg00033.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"otrs2 on Debian Linux");
  script_tag(name:"insight", value:"OTRS is an Open source Ticket Request System (also well known as
trouble ticket system) with many features to manage customer telephone
calls and e-mails. The system is built to allow your support, sales,
pre-sales, billing, internal IT, helpdesk, etc. department to react
quickly to inbound inquiries. For a detailed documentation see package
otrs-doc-en or otrs-doc-de.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
3.3.18-1+deb8u6.

We recommend that you upgrade your otrs2 packages.");
  script_tag(name:"summary",  value:"Fabien Arnoux discovered several security issues in email validation
of otrs system.

CVE-2018-16586

Load external image or CSS resources in browser when user opens a
malicious email.

CVE-2018-16587

Remote deletions of arbitrary files that the OTRS web server user
has write access when opening malicious email.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"otrs", ver:"3.3.18-1+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"otrs2", ver:"3.3.18-1+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
