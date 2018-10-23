###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_0a3b07a003_libreoffice_fc26.nasl 8939 2018-02-23 13:10:16Z santu $
#
# Fedora Update for libreoffice FEDORA-2018-0a3b07a003
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
  script_oid("1.3.6.1.4.1.25623.1.0.874130");
  script_version("$Revision: 8939 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-23 14:10:16 +0100 (Fri, 23 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-02-21 08:51:56 +0100 (Wed, 21 Feb 2018)");
  script_cve_id("CVE-2018-1055");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for libreoffice FEDORA-2018-0a3b07a003");
  script_tag(name: "summary", value: "Check the version of libreoffice");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "LibreOffice is an Open Source, 
community-developed, office productivity suite. It includes the key desktop 
applications, such as a word processor, spreadsheet, presentation manager, 
formula editor and drawing program, with a user interface and feature set 
similar to other office suites.  Sophisticated and flexible, LibreOffice 
also works transparently with a variety of file formats, including 
Microsoft Office File Formats.");
  script_tag(name: "affected", value: "libreoffice on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-0a3b07a003");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/D4MAIHIDCJDP46QIPC5NIWH6MGNX62J7");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"libreoffice", rpm:"libreoffice~5.3.7.2~8.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
