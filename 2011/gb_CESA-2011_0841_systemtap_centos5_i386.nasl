###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for systemtap CESA-2011:0841 centos5 i386
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
tag_insight = "SystemTap is an instrumentation system for systems running the Linux
  kernel, version 2.6. Developers can write scripts to collect data on the
  operation of the system.

  A divide-by-zero flaw was found in the way SystemTap handled malformed
  debugging information in DWARF format. When SystemTap unprivileged mode was
  enabled, an unprivileged user in the stapusr group could use this flaw to
  crash the system. Additionally, a privileged user (root, or a member of the
  stapdev group) could trigger this flaw when tricked into instrumenting a
  specially-crafted ELF binary, even when unprivileged mode was not enabled.
  (CVE-2011-1769)
  
  SystemTap users should upgrade to these updated packages, which contain a
  backported patch to correct this issue.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "systemtap on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-May/017601.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880519");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"1.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2011:0841");
  script_cve_id("CVE-2011-1769");
  script_name("CentOS Update for systemtap CESA-2011:0841 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of systemtap");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"systemtap", rpm:"systemtap~1.3~4.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemtap-client", rpm:"systemtap-client~1.3~4.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemtap-initscript", rpm:"systemtap-initscript~1.3~4.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemtap-runtime", rpm:"systemtap-runtime~1.3~4.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemtap-sdt-devel", rpm:"systemtap-sdt-devel~1.3~4.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemtap-server", rpm:"systemtap-server~1.3~4.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemtap-testsuite", rpm:"systemtap-testsuite~1.3~4.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
