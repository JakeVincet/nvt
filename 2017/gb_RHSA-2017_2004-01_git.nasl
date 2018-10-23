###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_2004-01_git.nasl 6855 2017-08-04 13:23:41Z cfischer $
#
# RedHat Update for git RHSA-2017:2004-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871860");
  script_version("$Revision: 6855 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-04 15:23:41 +0200 (Fri, 04 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-04 12:46:23 +0530 (Fri, 04 Aug 2017)");
  script_cve_id("CVE-2014-9938", "CVE-2017-8386", "CVE-2011-2192");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for git RHSA-2017:2004-01");
  script_tag(name: "summary", value: "Check the version of git");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "Git is a distributed revision control system 
  with a decentralized architecture. As opposed to centralized version control 
  systems with a client-server model, Git ensures that each working copy of a Git 
  repository is an exact copy with complete revision history. This not only allows 
  the user to work on and contribute to projects without the need to have 
  permission to push the changes to their official repositories, but also makes it 
  possible for the user to work with no network connection. Security Fix(es): * It 
  was found that the git-prompt.sh script shipped with git failed to correctly 
  handle branch names containing special characters. A specially crafted git 
  repository could use this flaw to execute arbitrary commands if a user working 
  with the repository configured their shell to include repository information in 
  the prompt. (CVE-2014-9938) * A flaw was found in the way git-shell handled 
  command-line options for the restricted set of git-shell commands. A remote, 
  authenticated attacker could use this flaw to bypass git-shell restrictions, to 
  view and manipulate files, by abusing the instance of the less command launched 
  using crafted command-line options. (CVE-2017-8386) Additional Changes: For 
  detailed information on changes in this release, see the Red Hat Enterprise 
  Linux 7.4 Release Notes linked from the References section. "); 
  script_tag(name: "affected", value: "git on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:2004-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-August/msg00025.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"perl-Git", rpm:"perl-Git~1.8.3.1~11.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git", rpm:"git~1.8.3.1~11.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-debuginfo", rpm:"git-debuginfo~1.8.3.1~11.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}