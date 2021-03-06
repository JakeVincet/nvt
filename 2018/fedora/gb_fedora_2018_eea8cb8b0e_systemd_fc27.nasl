###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_eea8cb8b0e_systemd_fc27.nasl 8986 2018-03-01 04:16:23Z santu $
#
# Fedora Update for systemd FEDORA-2018-eea8cb8b0e
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
  script_oid("1.3.6.1.4.1.25623.1.0.874163");
  script_version("$Revision: 8986 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-01 05:16:23 +0100 (Thu, 01 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-02-28 08:40:06 +0100 (Wed, 28 Feb 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for systemd FEDORA-2018-eea8cb8b0e");
  script_tag(name: "summary", value: "Check the version of systemd");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "systemd is a system and service manager 
that runs as PID 1 and starts the rest of the system. It provides aggressive 
parallelization capabilities, uses socket and D-Bus activation for starting 
services, offers on-demand starting of daemons, keeps track of processes 
using Linux control groups, maintains mount and automount points, and implements 
an elaborate transactional dependency-based service control logic. systemd 
supports SysV and LSB init scripts and works as a replacement for sysvinit. 
Other parts of this package are a logging daemon, utilities to control basic 
system configuration like the hostname, date, locale, maintain a list of 
logged-in users and running containers and virtual machines, system accounts, 
runtime directories and settings, and daemons to manage simple network 
configuration, network time synchronization, log forwarding, and name resolution.
");
  script_tag(name: "affected", value: "systemd on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-eea8cb8b0e");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NP234PYKFQYNITUYWNQSNNWRMPFVKGFH");
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

  if ((res = isrpmvuln(pkg:"systemd", rpm:"systemd~234~10.git5f8984e.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
