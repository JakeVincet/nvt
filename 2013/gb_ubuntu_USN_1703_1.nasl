###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1703_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for mysql-5.5 USN-1703-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");



if(description)
{
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1703-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841291");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-01-24 09:36:50 +0530 (Thu, 24 Jan 2013)");
  script_cve_id("CVE-2012-0572", "CVE-2012-0574", "CVE-2012-0578", "CVE-2012-1702",
                "CVE-2012-1705", "CVE-2012-5060", "CVE-2012-5096", "CVE-2012-5611",
                "CVE-2012-5612", "CVE-2013-0367", "CVE-2013-0368", "CVE-2013-0371",
                "CVE-2013-0375", "CVE-2013-0383", "CVE-2013-0384", "CVE-2013-0385",
                "CVE-2013-0386", "CVE-2013-0389");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_xref(name:"USN", value:"1703-1");
  script_name("Ubuntu Update for mysql-5.5 USN-1703-1");

  script_tag(name:"summary", value:"Check for the Version of mysql-5.5");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.04 LTS|11\.10|10\.04 LTS|12\.10)");
  script_tag(name:"affected", value:"mysql-5.5 on Ubuntu 12.10,
  Ubuntu 12.04 LTS,
  Ubuntu 11.10,
  Ubuntu 10.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Multiple security issues were discovered in MySQL and this update includes
  new upstream MySQL versions to fix these issues.

  MySQL has been updated to 5.1.67 in Ubuntu 10.04 LTS and Ubuntu 11.10.
  Ubuntu 12.04 LTS and Ubuntu 12.10 have been updated to MySQL 5.5.29.

  In addition to security fixes, the updated packages contain bug fixes, new
  features, and possibly incompatible changes.

  Please see the following for more information:
  http://dev.mysql.com/doc/relnotes/mysql/5.1/en/news-5-1-67.html");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.5", ver:"5.5.29-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.1", ver:"5.1.67-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.1", ver:"5.1.67-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.5", ver:"5.5.29-0ubuntu0.12.10.1", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
