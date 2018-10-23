###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for kdegames FEDORA-2011-5200
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_affected = "kdegames on Fedora 14";
tag_insight = "Games for KDE 4, including:
  * bomber
  * bovo
  * granatier
  * kajongg
  * kapman
  * katomic
  * kblackbox
  * kblocks
  * kbounce
  * kbreakout
  * kdiamond
  * kfourinline
  * kgoldrunner
  * kigo
  * killbots
  * kiriki
  * kjumpingcube
  * klickety
  * klines
  * knetwalk
  * kolf
  * kollision
  * konquest
  * kreversi
  * ksame
  * kshisen
  * ksirk
  * ksnakeduel / ksnake
  * kspaceduel
  * ksquares
  * ksudoku
  * ktuberling
  * kubrick
  * lskat
  * naval battle
  * palapeli";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-April/058672.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863037");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-04-22 16:44:44 +0200 (Fri, 22 Apr 2011)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_xref(name: "FEDORA", value: "2011-5200");
  script_cve_id("CVE-2011-1168");
  script_name("Fedora Update for kdegames FEDORA-2011-5200");

  script_tag(name:"summary", value:"Check for the Version of kdegames");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
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

if(release == "FC14")
{

  if ((res = isrpmvuln(pkg:"kdegames", rpm:"kdegames~4.6.2~1.fc14", rls:"FC14")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
