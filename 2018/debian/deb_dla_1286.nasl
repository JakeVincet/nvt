###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1286.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 1286-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891286");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2018-5378", "CVE-2018-5379", "CVE-2018-5380", "CVE-2018-5381");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1286-1] quagga security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-02-21 00:00:00 +0100 (Wed, 21 Feb 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/02/msg00021.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"quagga on Debian Linux");
  script_tag(name:"insight", value:"GNU Quagga is free software which manages TCP/IP based routing protocols.
It supports BGP4, BGP4+, OSPFv2, OSPFv3, IS-IS, RIPv1, RIPv2, and RIPng as
well as the IPv6 versions of these.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
0.99.22.4-1+wheezy3+deb7u3.

We recommend that you upgrade your quagga packages.");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in Quagga, a routing
daemon. The Common Vulnerabilities and Exposures project identifies the
following issues:

CVE-2018-5378

It was discovered that the Quagga BGP daemon, bgpd, does not
properly bounds check data sent with a NOTIFY to a peer, if an
attribute length is invalid. A configured BGP peer can take
advantage of this bug to read memory from the bgpd process or cause
a denial of service (daemon crash).");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"quagga", ver:"0.99.22.4-1+wheezy3+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"quagga-dbg", ver:"0.99.22.4-1+wheezy3+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"quagga-doc", ver:"0.99.22.4-1+wheezy3+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}