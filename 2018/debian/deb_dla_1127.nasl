###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1127.nasl 10219 2018-06-15 12:00:55Z cfischer $
#
# Auto-generated from advisory DLA 1127-1 using nvtgen 1.0
# Script version:1.1
# #
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
  script_oid("1.3.6.1.4.1.25623.1.0.891127");
  script_version("$Revision: 10219 $");
  script_cve_id("CVE-2017-14628", "CVE-2017-14629", "CVE-2017-14630", "CVE-2017-14631", "CVE-2017-14636", "CVE-2017-14637");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1127-1] sam2p security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-15 14:00:55 +0200 (Fri, 15 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-02-07 00:00:00 +0100 (Wed, 07 Feb 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/10/msg00007.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"sam2p on Debian Linux");
  script_tag(name:"insight", value:"sam2p is a command line utility that converts many raster
(bitmap) image formats like GIF, JPG/JPEG, and PNG into
PostScript or PDF files. PS or EPS files created by sam2p are
usually not much larger than the source file.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
0.49.1-1+deb7u1.

We recommend that you upgrade your sam2p packages.

Further information about Debian LTS security advisories, how to apply
these updates to your system and frequently asked questions can be
found at: https://wiki.debian.org/LTS");
  script_tag(name:"summary",  value:"Several vulnerabilities, like heap-based buffer overflows, integer signedness or overflow errors have been found by fpbibi and have been fixed by upstream..");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"sam2p", ver:"0.49.1-1+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
