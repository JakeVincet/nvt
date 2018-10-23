###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for java-1.7.0-openjdk RHSA-2013:0247-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "These packages provide the OpenJDK 7 Java Runtime Environment and the
  OpenJDK 7 Software Development Kit.

  Multiple improper permission check issues were discovered in the AWT,
  CORBA, JMX, Libraries, and Beans components in OpenJDK. An untrusted Java
  application or applet could use these flaws to bypass Java sandbox
  restrictions. (CVE-2013-0442, CVE-2013-0445, CVE-2013-0441, CVE-2013-1475,
  CVE-2013-1476, CVE-2013-0429, CVE-2013-0450, CVE-2013-0425, CVE-2013-0426,
  CVE-2013-0428, CVE-2013-0444)

  Multiple flaws were found in the way image parsers in the 2D and AWT
  components handled image raster parameters. A specially-crafted image could
  cause Java Virtual Machine memory corruption and, possibly, lead to
  arbitrary code execution with the virtual machine privileges.
  (CVE-2013-1478, CVE-2013-1480)

  A flaw was found in the AWT component's clipboard handling code. An
  untrusted Java application or applet could use this flaw to access
  clipboard data, bypassing Java sandbox restrictions. (CVE-2013-0432)

  The default Java security properties configuration did not restrict access
  to certain com.sun.xml.internal packages. An untrusted Java application or
  applet could use this flaw to access information, bypassing certain Java
  sandbox restrictions. This update lists the whole package as restricted.
  (CVE-2013-0435)

  Multiple improper permission check issues were discovered in the JMX,
  Libraries, Networking, and JAXP components. An untrusted Java application
  or applet could use these flaws to bypass certain Java sandbox
  restrictions. (CVE-2013-0431, CVE-2013-0427, CVE-2013-0433, CVE-2013-0434)

  It was discovered that the RMI component's CGIHandler class used user
  inputs in error messages without any sanitization. An attacker could use
  this flaw to perform a cross-site scripting (XSS) attack. (CVE-2013-0424)

  It was discovered that the SSL/TLS implementation in the JSSE component
  did not properly enforce handshake message ordering, allowing an unlimited
  number of handshake restarts. A remote attacker could use this flaw to
  make an SSL/TLS server using JSSE consume an excessive amount of CPU by
  continuously restarting the handshake. (CVE-2013-0440)

  It was discovered that the JSSE component did not properly validate
  Diffie-Hellman public keys. An SSL/TLS client could possibly use this flaw
  to perform a small subgroup attack. (CVE-2013-0443)

  This erratu ...

  Description truncated, for more information please check the Reference URL";


tag_affected = "java-1.7.0-openjdk on Red Hat Enterprise Linux (v. 5 server),
  Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2013-February/msg00015.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870904");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-02-11 10:15:50 +0530 (Mon, 11 Feb 2013)");
  script_cve_id("CVE-2013-0424", "CVE-2013-0425", "CVE-2013-0426", "CVE-2013-0427",
                "CVE-2013-0428", "CVE-2013-0429", "CVE-2013-0431", "CVE-2013-0432",
                "CVE-2013-0433", "CVE-2013-0434", "CVE-2013-0435", "CVE-2013-0440",
                "CVE-2013-0441", "CVE-2013-0442", "CVE-2013-0443", "CVE-2013-0444",
                "CVE-2013-0445", "CVE-2013-0450", "CVE-2013-1475", "CVE-2013-1476",
                "CVE-2013-1478", "CVE-2013-1480");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "RHSA", value: "2013:0247-01");
  script_name("RedHat Update for java-1.7.0-openjdk RHSA-2013:0247-01");

  script_tag(name: "summary" , value: "Check for the Version of java-1.7.0-openjdk");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.9~2.3.5.3.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-debuginfo", rpm:"java-1.7.0-openjdk-debuginfo~1.7.0.9~2.3.5.3.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.9~2.3.5.3.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.9~2.3.5.3.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-debuginfo", rpm:"java-1.7.0-openjdk-debuginfo~1.7.0.9~2.3.5.3.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-demo", rpm:"java-1.7.0-openjdk-demo~1.7.0.9~2.3.5.3.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.9~2.3.5.3.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.9~2.3.5.3.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-src", rpm:"java-1.7.0-openjdk-src~1.7.0.9~2.3.5.3.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
