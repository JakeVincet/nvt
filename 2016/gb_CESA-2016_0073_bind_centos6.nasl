###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for bind CESA-2016:0073 centos6
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882386");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-01-28 06:32:56 +0100 (Thu, 28 Jan 2016)");
  script_cve_id("CVE-2015-8704");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for bind CESA-2016:0073 centos6 ");
  script_tag(name: "summary", value: "Check the version of bind");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The Berkeley Internet Name Domain (BIND)
is an implementation of the Domain Name System (DNS) protocols. BIND includes a
DNS server (named)  a resolver library (routines for applications to use when
interfacing with DNS)  and tools for verifying that the DNS server is operating
correctly.

A denial of service flaw was found in the way BIND processed certain
malformed Address Prefix List (APL) records. A remote, authenticated
attacker could use this flaw to cause named to crash. (CVE-2015-8704)

Red Hat would like to thank ISC for reporting this issue.

All bind users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue. After installing the
update, the BIND daemon (named) will be restarted automatically.
");
  script_tag(name: "affected", value: "bind on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:0073");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-January/021630.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"bind", rpm:"bind~9.8.2~0.37.rc1.el6_7.6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-chroot", rpm:"bind-chroot~9.8.2~0.37.rc1.el6_7.6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-devel", rpm:"bind-devel~9.8.2~0.37.rc1.el6_7.6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-libs", rpm:"bind-libs~9.8.2~0.37.rc1.el6_7.6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-sdb", rpm:"bind-sdb~9.8.2~0.37.rc1.el6_7.6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-utils", rpm:"bind-utils~9.8.2~0.37.rc1.el6_7.6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
