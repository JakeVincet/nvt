###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_49bda79bd5_kernel-headers_fc27.nasl 11736 2018-10-04 03:08:30Z ckuersteiner $
#
# Fedora Update for kernel-headers FEDORA-2018-49bda79bd5
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
  script_oid("1.3.6.1.4.1.25623.1.0.874891");
  script_version("$Revision: 11736 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-04 05:08:30 +0200 (Thu, 04 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-08-04 06:07:16 +0200 (Sat, 04 Aug 2018)");
  script_cve_id("CVE-2018-14678");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for kernel-headers FEDORA-2018-49bda79bd5");
  script_tag(name:"summary", value:"Check the version of kernel-headers");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Kernel-headers includes the C header files 
that specify the interface between the Linux kernel and userspace libraries and 
programs.  The header files define structures and constants that are needed for
building most standard programs and are also needed for rebuilding the glibc 
package.
");
  script_tag(name:"affected", value:"kernel-headers on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-49bda79bd5");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/7QQN3CUZNOQYFVORTDI6A35IUM53IGC2");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~4.17.11~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
