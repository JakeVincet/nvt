###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for python RHSA-2011:0492-01
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
tag_insight = "Python is an interpreted, interactive, object-oriented programming
  language.

  A flaw was found in the Python urllib and urllib2 libraries where they
  would not differentiate between different target URLs when handling
  automatic redirects. This caused Python applications using these modules to
  follow any new URL that they understood, including the &quot;file://&quot; URL type.
  This could allow a remote server to force a local Python application to
  read a local file instead of the remote one, possibly exposing local files
  that were not meant to be exposed. (CVE-2011-1521)
  
  A race condition was found in the way the Python smtpd module handled new
  connections. A remote user could use this flaw to cause a Python script
  using the smtpd module to terminate. (CVE-2010-3493)
  
  An information disclosure flaw was found in the way the Python
  CGIHTTPServer module processed certain HTTP GET requests. A remote attacker
  could use a specially-crafted request to obtain the CGI script's source
  code. (CVE-2011-1015)
  
  A buffer over-read flaw was found in the way the Python Expat parser
  handled malformed UTF-8 sequences when processing XML files. A
  specially-crafted XML file could cause Python applications using the Python
  Expat parser to crash while parsing the file. (CVE-2009-3720)
  
  This update makes Python use the system Expat library rather than its own
  internal copy; therefore, users must have the version of Expat shipped with
  RHSA-2009:1625 installed, or a later version, to resolve the CVE-2009-3720
  issue.
  
  All Python users should upgrade to these updated packages, which contain
  backported patches to correct these issues.";

tag_affected = "python on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-May/msg00006.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870428");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-05-06 16:22:00 +0200 (Fri, 06 May 2011)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_xref(name: "RHSA", value: "2011:0492-01");
  script_cve_id("CVE-2009-3720", "CVE-2010-3493", "CVE-2011-1015", "CVE-2011-1521");
  script_name("RedHat Update for python RHSA-2011:0492-01");

  script_tag(name:"summary", value:"Check for the Version of python");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
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

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"python", rpm:"python~2.4.3~44.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-debuginfo", rpm:"python-debuginfo~2.4.3~44.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-devel", rpm:"python-devel~2.4.3~44.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-libs", rpm:"python-libs~2.4.3~44.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-tools", rpm:"python-tools~2.4.3~44.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tkinter", rpm:"tkinter~2.4.3~44.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
