###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_bb5d87e9de_mingw-libzip_fc25.nasl 7237 2017-09-22 15:00:35Z cfischer $
#
# Fedora Update for mingw-libzip FEDORA-2017-bb5d87e9de
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
  script_oid("1.3.6.1.4.1.25623.1.0.873413");
  script_version("$Revision: 7237 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-22 17:00:35 +0200 (Fri, 22 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-20 12:40:45 +0200 (Wed, 20 Sep 2017)");
  script_cve_id("CVE-2017-14107");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mingw-libzip FEDORA-2017-bb5d87e9de");
  script_tag(name: "summary", value: "Check the version of mingw-libzip");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "libzip is a C library for reading, creating, 
and modifying zip archives. Files can be added from data buffers, files, or 
compressed data copied directly from other zip archives. Changes made without 
closing the archive can be reverted. The API is documented by man pages.");
  script_tag(name: "affected", value: "mingw-libzip on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-bb5d87e9de");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DNDYMKUQ4OZKLMFYE5QUBDC5FQC3DHE3");
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

  if ((res = isrpmvuln(pkg:"mingw32-libzip", rpm:"mingw32-libzip~1.1.3~3.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mingw64-libzip", rpm:"mingw64-libzip~1.1.3~3.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}