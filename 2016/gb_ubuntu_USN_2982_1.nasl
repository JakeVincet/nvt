###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for libksba USN-2982-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842766");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-05-18 05:19:40 +0200 (Wed, 18 May 2016)");
  script_cve_id("CVE-2016-4353", "CVE-2016-4354", "CVE-2016-4355", "CVE-2016-4356",
 		"CVE-2016-4574", "CVE-2016-4579");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for libksba USN-2982-1");
  script_tag(name:"summary", value:"Check the version of libksba");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Hanno B&#246 ck discovered that Libksba
  incorrectly handled decoding certain BER data. An attacker could use this issue
  to cause Libksba to crash, resulting in a denial of service. This issue only
  applied to Ubuntu 12.04 LTS and Ubuntu 14.04 LTS. (CVE-2016-4353)

  Hanno B&#246 ck discovered that Libksba incorrectly handled decoding certain BER
  data. An attacker could use this issue to cause Libksba to crash, resulting
  in a denial of service, or possibly execute arbitrary code. This issue only
  applied to Ubuntu 12.04 LTS and Ubuntu 14.04 LTS. (CVE-2016-4354,
  CVE-2016-4355)

  Hanno B&#246 ck discovered that Libksba incorrectly handled incorrect utf-8
  strings when decoding certain DN data. An attacker could use this issue to
  cause Libksba to crash, resulting in a denial of service, or possibly
  execute arbitrary code. This issue only applied to Ubuntu 12.04 LTS and
  Ubuntu 14.04 LTS. (CVE-2016-4356)

  Pascal Cuoq discovered that Libksba incorrectly handled incorrect utf-8
  strings when decoding certain DN data. An attacker could use this issue to
  cause Libksba to crash, resulting in a denial of service, or possibly
  execute arbitrary code. (CVE-2016-4574)

  Pascal Cuoq discovered that Libksba incorrectly handled decoding certain
  data. An attacker could use this issue to cause Libksba to crash, resulting
  in a denial of service. (CVE-2016-4579)");
  script_tag(name:"affected", value:"libksba on Ubuntu 16.04 LTS,
  Ubuntu 15.10,
  Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"2982-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2982-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS|16\.04 LTS|15\.10)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libksba8:i386", ver:"1.3.0-3ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libksba8:amd64", ver:"1.3.0-3ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libksba8:i386", ver:"1.2.0-2ubuntu0.2", rls:"UBUNTU12.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libksba8:amd64", ver:"1.2.0-2ubuntu0.2", rls:"UBUNTU12.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libksba8:i386", ver:"1.3.3-1ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libksba8:amd64", ver:"1.3.3-1ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"libksba8:i386", ver:"1.3.3-1ubuntu0.15.10.1", rls:"UBUNTU15.10")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libksba8:amd64", ver:"1.3.3-1ubuntu0.15.10.1", rls:"UBUNTU15.10")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
