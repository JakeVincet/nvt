###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2012_1324_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# SuSE Update for flash-player openSUSE-SU-2012:1324-1 (flash-player)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_affected = "flash-player on openSUSE 12.1, openSUSE 11.4";
tag_insight = "Flash Player was updated to 11.2.202.243
  * CVE-2012-5248, CVE-2012-5249, CVE-2012-5250,
  CVE-2012-5251, CVE-2012-5252, CVE-2012-5253,
  CVE-2012-5254, CVE-2012-5255, CVE-2012-5256,
  CVE-2012-5257, CVE-2012-5258, CVE-2012-5259,
  CVE-2012-5260, CVE-2012-5261, CVE-2012-5262,
  CVE-2012-5263, CVE-2012-5264, CVE-2012-5265,
  CVE-2012-5266, CVE-2012-5267, CVE-2012-5268,
  CVE-2012-5269, CVE-2012-5270, CVE-2012-5271,
  CVE-2012-5272";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850347");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-12-13 17:01:52 +0530 (Thu, 13 Dec 2012)");
  script_cve_id("CVE-2012-5252", "CVE-2012-5256", "CVE-2012-5260", "CVE-2012-5264",
                "CVE-2012-5268", "CVE-2012-5272", "CVE-2012-5248", "CVE-2012-5249",
                "CVE-2012-5250", "CVE-2012-5251", "CVE-2012-5253", "CVE-2012-5254",
                "CVE-2012-5255", "CVE-2012-5257", "CVE-2012-5258", "CVE-2012-5259",
                "CVE-2012-5261", "CVE-2012-5262", "CVE-2012-5263", "CVE-2012-5265",
                "CVE-2012-5266", "CVE-2012-5267", "CVE-2012-5269", "CVE-2012-5270",
                "CVE-2012-5271");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "openSUSE-SU", value: "2012:1324_1");
  script_name("SuSE Update for flash-player openSUSE-SU-2012:1324-1 (flash-player)");

  script_tag(name: "summary" , value: "Check for the Version of flash-player");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE11.4")
{

  if ((res = isrpmvuln(pkg:"flash-player", rpm:"flash-player~11.2.202.243~23.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-gnome", rpm:"flash-player-gnome~11.2.202.243~23.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-kde4", rpm:"flash-player-kde4~11.2.202.243~23.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "openSUSE12.1")
{

  if ((res = isrpmvuln(pkg:"flash-player", rpm:"flash-player~11.2.202.243~30.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-gnome", rpm:"flash-player-gnome~11.2.202.243~30.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-kde4", rpm:"flash-player-kde4~11.2.202.243~30.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
