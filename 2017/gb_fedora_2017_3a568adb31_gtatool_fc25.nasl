###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_3a568adb31_gtatool_fc25.nasl 7336 2017-10-04 05:42:02Z asteins $
#
# Fedora Update for gtatool FEDORA-2017-3a568adb31
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.873405");
  script_version("$Revision: 7336 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-04 07:42:02 +0200 (Wed, 04 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-09-20 12:25:36 +0200 (Wed, 20 Sep 2017)");
  script_cve_id("CVE-2017-14482");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for gtatool FEDORA-2017-3a568adb31");
  script_tag(name: "summary", value: "Check the version of gtatool");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Gtatool is a command line tool to 
manipulate GTAs.
It provides a set of commands that manipulate GTAs on various levels:
array element components, array dimensions, whole arrays, and streams of arrays.
For example, you can add components to array elements, merge separate arrays
into combined arrays in different ways, apply global transformations to array
data, reorder the array data, and much more.

Additionally, gtatool can import from and export to many other file formats, see
the sub-packages!
");
  script_tag(name: "affected", value: "gtatool on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-3a568adb31");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/P4L6LVGI7FQUFPEVUSL2XLH4ZQQMYKNQ");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"gtatool", rpm:"gtatool~2.2.0~6.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
