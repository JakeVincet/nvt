###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for pidgin FEDORA-2011-17558
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Pidgin allows you to talk to anyone using a variety of messaging
  protocols including AIM, MSN, Yahoo!, Jabber, Bonjour, Gadu-Gadu,
  ICQ, IRC, Novell Groupwise, QQ, Lotus Sametime, SILC, Simple and
  Zephyr.  These protocols are implemented using a modular, easy to
  use design.  To use a protocol, just add an account using the
  account editor.

  Pidgin supports many common features of other clients, as well as many
  unique features, such as perl scripting, TCL scripting and C plugins.

  Pidgin is not affiliated with or endorsed by America Online, Inc.,
  Microsoft Corporation, Yahoo! Inc., or ICQ Inc.";

tag_affected = "pidgin on Fedora 16";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-January/071621.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863982");
  script_version("$Revision: 8671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-05 17:38:48 +0100 (Mon, 05 Feb 2018) $");
  script_tag(name:"creation_date", value:"2012-04-02 12:47:41 +0530 (Mon, 02 Apr 2012)");
  script_cve_id("CVE-2011-3594", "CVE-2011-4601", "CVE-2011-4602", "CVE-2011-4603");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "FEDORA", value: "2011-17558");
  script_name("Fedora Update for pidgin FEDORA-2011-17558");

  script_tag(name: "summary" , value: "Check for the Version of pidgin");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
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

if(release == "FC16")
{

  if ((res = isrpmvuln(pkg:"pidgin", rpm:"pidgin~2.10.1~1.fc16", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
