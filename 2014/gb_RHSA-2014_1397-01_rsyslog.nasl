###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for rsyslog RHSA-2014:1397-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871257");
  script_version("$Revision: 6724 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-14 11:57:17 +0200 (Fri, 14 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-10-14 06:06:10 +0200 (Tue, 14 Oct 2014)");
  script_cve_id("CVE-2014-3634");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("RedHat Update for rsyslog RHSA-2014:1397-01");
  script_tag(name: "summary", value: "Check the version of rsyslog");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The rsyslog packages provide an enhanced, multi-threaded syslog daemon
that supports writing to relational databases, syslog/TCP, RFC 3195,
permitted sender lists, filtering on any message part, and fine grained
output format control.

A flaw was found in the way rsyslog handled invalid log message priority
values. In certain configurations, a local attacker, or a remote attacker
able to connect to the rsyslog port, could use this flaw to crash the
rsyslog daemon or, potentially, execute arbitrary code as the user running
the rsyslog daemon. (CVE-2014-3634)

Red Hat would like to thank Rainer Gerhards of rsyslog upstream for
reporting this issue.

All rsyslog users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue. After installing the
update, the rsyslog service will be restarted automatically.
");
  script_tag(name: "affected", value: "rsyslog on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2014:1397-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-October/msg00009.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"rsyslog", rpm:"rsyslog~7.4.7~7.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rsyslog-debuginfo", rpm:"rsyslog-debuginfo~7.4.7~7.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rsyslog-gnutls", rpm:"rsyslog-gnutls~7.4.7~7.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rsyslog-gssapi", rpm:"rsyslog-gssapi~7.4.7~7.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rsyslog-mmjsonparse", rpm:"rsyslog-mmjsonparse~7.4.7~7.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rsyslog-mysql", rpm:"rsyslog-mysql~7.4.7~7.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rsyslog-pgsql", rpm:"rsyslog-pgsql~7.4.7~7.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rsyslog-relp", rpm:"rsyslog-relp~7.4.7~7.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
