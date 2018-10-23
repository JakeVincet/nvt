###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_a0ffdf1fbd_mingw-poppler_fc26.nasl 7604 2017-11-01 06:48:12Z asteins $
#
# Fedora Update for mingw-poppler FEDORA-2017-a0ffdf1fbd
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
  script_oid("1.3.6.1.4.1.25623.1.0.873548");
  script_version("$Revision: 7604 $");
  script_tag(name:"last_modification", value:"$Date: 2017-11-01 07:48:12 +0100 (Wed, 01 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-10-27 20:55:27 +0200 (Fri, 27 Oct 2017)");
  script_cve_id("CVE-2017-14517", "CVE-2017-14518", "CVE-2017-14519", "CVE-2017-14617", 
                "CVE-2017-14926", "CVE-2017-14927", "CVE-2017-14928", "CVE-2017-14929", 
                "CVE-2017-14975", "CVE-2017-14976", "CVE-2017-14977");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mingw-poppler FEDORA-2017-a0ffdf1fbd");
  script_tag(name: "summary", value: "Check the version of mingw-poppler");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "MinGW Windows Poppler library.
");
  script_tag(name: "affected", value: "mingw-poppler on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-a0ffdf1fbd");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/7Q4ELLLXXPAS3ZVHBECKZMU6TOYYV4YI");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"mingw32-poppler", rpm:"mingw32-poppler~0.52.0~5.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
