###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_ed735463e3_xen_fc25.nasl 7237 2017-09-22 15:00:35Z cfischer $
#
# Fedora Update for xen FEDORA-2017-ed735463e3
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
  script_oid("1.3.6.1.4.1.25623.1.0.873378");
  script_version("$Revision: 7237 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-22 17:00:35 +0200 (Fri, 22 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-16 07:45:27 +0200 (Sat, 16 Sep 2017)");
  script_cve_id("CVE-2017-9330", "CVE-2017-10664", "CVE-2017-8309", "CVE-2017-8379", 
                "CVE-2017-5579", "CVE-2017-7718", "CVE-2017-12135", "CVE-2017-12137", 
                "CVE-2017-12136", "CVE-2017-12855");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for xen FEDORA-2017-ed735463e3");
  script_tag(name: "summary", value: "Check the version of xen");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "This package contains the XenD daemon and xm command line
tools, needed to manage virtual machines running under the
Xen hypervisor
");
  script_tag(name: "affected", value: "xen on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-ed735463e3");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BOC4V47PNNEIZKIK3YWSMOJYB45QJ2QU");
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

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.7.3~4.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
