###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_a94297f037_sleuthkit_fc28.nasl 11138 2018-08-28 05:15:49Z ckuersteiner $
#
# Fedora Update for sleuthkit FEDORA-2018-a94297f037
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
  script_oid("1.3.6.1.4.1.25623.1.0.874991");
  script_version("$Revision: 11138 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-28 07:15:49 +0200 (Tue, 28 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-26 07:07:29 +0200 (Sun, 26 Aug 2018)");
  script_cve_id("CVE-2018-11737", "CVE-2018-11738", "CVE-2018-11739", "CVE-2018-11740", "CVE-2017-13755", "CVE-2017-13756", "CVE-2017-13760");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for sleuthkit FEDORA-2018-a94297f037");
  script_tag(name:"summary", value:"Check the version of sleuthkit");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The Sleuth Kit (TSK) is a collection of UNIX-based command line tools that
allow you to investigate a computer. The current focus of the tools is the
file and volume systems and TSK supports FAT, Ext2/3, NTFS, UFS,
and ISO 9660 file systems
");
  script_tag(name:"affected", value:"sleuthkit on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-a94297f037");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/H22GDBPNHWVTUV7RQKDWMZ4XVL2XEWIX");
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

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"sleuthkit", rpm:"sleuthkit~4.6.2~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
