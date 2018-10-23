###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3702_2.nasl 11180 2018-08-31 14:10:20Z mmartin $
#
# Ubuntu Update for php7.2 USN-3702-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
  script_oid("1.3.6.1.4.1.25623.1.0.843583");
  script_version("$Revision: 11180 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-31 16:10:20 +0200 (Fri, 31 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-06 05:50:33 +0200 (Fri, 06 Jul 2018)");
  script_cve_id("CVE-2018-12882");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for php7.2 USN-3702-2");
  script_tag(name:"summary", value:"Check the version of php7.2");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-3702-1 fixed a vulnerability in PHP. PHP 7.2.7 did not actually include
the fix for CVE-2018-12882. This update adds a backported patch to correct
the issue.

We apologize for the inconvenience.

Original advisory details:

It was discovered that PHP incorrectly handled exif tags in certain images.
A remote attacker could use this issue to cause PHP to crash, resulting in
a denial of service, or possibly execute arbitrary code.");
  script_tag(name:"affected", value:"php7.2 on Ubuntu 18.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3702-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3702-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU18\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libapache2-mod-php7.2", ver:"7.2.7-0ubuntu0.18.04.2", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php7.2-cgi", ver:"7.2.7-0ubuntu0.18.04.2", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php7.2-cli", ver:"7.2.7-0ubuntu0.18.04.2", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php7.2-fpm", ver:"7.2.7-0ubuntu0.18.04.2", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
