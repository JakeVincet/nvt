###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for java CESA-2016:1504 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882530");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-08-02 10:56:52 +0530 (Tue, 02 Aug 2016)");
  script_cve_id("CVE-2016-3458", "CVE-2016-3500", "CVE-2016-3508", "CVE-2016-3550", 
                "CVE-2016-3598", "CVE-2016-3606", "CVE-2016-3610");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for java CESA-2016:1504 centos7 ");
  script_tag(name: "summary", value: "Check the version of java");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The java-1.7.0-openjdk packages provide 
the OpenJDK 7 Java Runtime Environment and the OpenJDK 7 
Java Software Development Kit.

Security Fix(es):

* Multiple flaws were discovered in the Hotspot and Libraries components in
OpenJDK. An untrusted Java application or applet could use these flaws to
completely bypass Java sandbox restrictions. (CVE-2016-3606, CVE-2016-3598,
CVE-2016-3610)

* Multiple denial of service flaws were found in the JAXP component in
OpenJDK. A specially crafted XML file could cause a Java application using
JAXP to consume an excessive amount of CPU and memory when parsed.
(CVE-2016-3500, CVE-2016-3508)

* Multiple flaws were found in the CORBA and Hotsport components in
OpenJDK. An untrusted Java application or applet could use these flaws to
bypass certain Java sandbox restrictions. (CVE-2016-3458, CVE-2016-3550)
");
  script_tag(name: "affected", value: "java on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:1504");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-July/021997.html");
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

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.111~2.6.7.2.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-accessibility", rpm:"java-1.7.0-openjdk-accessibility~1.7.0.111~2.6.7.2.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-demo", rpm:"java-1.7.0-openjdk-demo~1.7.0.111~2.6.7.2.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.111~2.6.7.2.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-headless", rpm:"java-1.7.0-openjdk-headless~1.7.0.111~2.6.7.2.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.111~2.6.7.2.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-src", rpm:"java-1.7.0-openjdk-src~1.7.0.111~2.6.7.2.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
