###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1303.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 1303-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891303");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2018-7536", "CVE-2018-7537");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1303-1] python-django security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-03-27 00:00:00 +0200 (Tue, 27 Mar 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/03/msg00006.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"python-django on Debian Linux");
  script_tag(name:"insight", value:"Django is a high-level web application framework that loosely follows the
model-view-controller design pattern.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
1.4.22-1+deb7u4.

We recommend that you upgrade your python-django packages.");
  script_tag(name:"summary",  value:"Several functions were extremely slow to evaluate certain inputs due to
catastrophic backtracking vulnerabilities in several regular expressions.

CVE-2018-7536

The django.utils.html.urlize() function was extremely slow to evaluate
certain inputs due to catastrophic backtracking vulnerabilities in two
regular expressions. The urlize() function is used to implement the urlize
and urlizetrunc template filters, which were thus vulnerable.

The problematic regular expressions are replaced with parsing logic that
behaves similarly.

CVE-2018-7537

If django.utils.text.Truncator's chars() and words() methods were passed
the html=True argument, they were extremely slow to evaluate certain inputs
due to a catastrophic backtracking vulnerability in a regular expression.
The chars() and words() methods are used to implement the truncatechars_html
and truncatewords_html template filters, which were thus vulnerable.

The backtracking problem in the regular expression is fixed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"python-django", ver:"1.4.22-1+deb7u4", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-django-doc", ver:"1.4.22-1+deb7u4", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
