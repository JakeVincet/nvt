###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_cafcdbdde5_kernel_fc25.nasl 7601 2017-10-31 06:41:32Z santu $
#
# Fedora Update for kernel FEDORA-2017-cafcdbdde5
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
  script_oid("1.3.6.1.4.1.25623.1.0.873543");
  script_version("$Revision: 7601 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-31 07:41:32 +0100 (Tue, 31 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-27 20:55:04 +0200 (Fri, 27 Oct 2017)");
  script_cve_id("CVE-2017-12190", "CVE-2017-15265", "CVE-2017-15299", "CVE-2017-1000255", 
                "CVE-2017-5123");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for kernel FEDORA-2017-cafcdbdde5");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel meta package
");
  script_tag(name: "affected", value: "kernel on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-cafcdbdde5");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VVT5E3LS2TSDUFSUNPWJHOO3CXTC5XMX");
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

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~4.13.8~100.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
