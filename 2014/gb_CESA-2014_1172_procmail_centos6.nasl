###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for procmail CESA-2014:1172 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882022");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-09-11 05:58:30 +0200 (Thu, 11 Sep 2014)");
  script_cve_id("CVE-2014-3618");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("CentOS Update for procmail CESA-2014:1172 centos6 ");
  script_tag(name: "insight", value: "The procmail program is used for local
mail delivery. In addition to just delivering mail, procmail can be used for
automatic filtering, presorting, and other mail handling jobs.

A heap-based buffer overflow flaw was found in procmail's formail utility.
A remote attacker could send an email with specially crafted headers that,
when processed by formail, could cause procmail to crash or, possibly,
execute arbitrary code as the user running formail. (CVE-2014-3618)

All procmail users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue.
");
  script_tag(name: "affected", value: "procmail on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name: "CESA", value: "2014:1172");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-September/020550.html");
  script_tag(name:"summary", value:"Check for the Version of procmail");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"procmail", rpm:"procmail~3.22~25.1.el6_5.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
