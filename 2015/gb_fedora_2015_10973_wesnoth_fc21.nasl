###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for wesnoth FEDORA-2015-10973
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.869743");
  script_version("$Revision: 7419 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-13 09:51:30 +0200 (Fri, 13 Oct 2017) $");
  script_tag(name:"creation_date", value:"2015-07-14 06:36:55 +0200 (Tue, 14 Jul 2015)");
  script_cve_id("CVE-2015-5069", "CVE-2015-5070");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for wesnoth FEDORA-2015-10973");
  script_tag(name: "summary", value: "Check the version of wesnoth");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The Battle for Wesnoth is a turn-based strategy game with a fantasy theme.

Build up a great army, gradually turning raw recruits into hardened
veterans. In later games, recall your toughest warriors and form a deadly
host against whom none can stand. Choose units from a large pool of
specialists, and hand-pick a force with the right strengths to fight well
on different terrains against all manner of opposition.

Fight to regain the throne of Wesnoth, of which you are the legitimate
heir, or use your dread power over the Undead to dominate the land of
mortals, or lead your glorious Orcish tribe to victory against the humans
who dared despoil your lands. Wesnoth has many different sagas waiting to
be played out. You can create your own custom units, and write your own
scenarios--or even full-blown campaigns. You can also challenge your
friends--or strangers--and fight multi-player epic fantasy battles.
");
  script_tag(name: "affected", value: "wesnoth on Fedora 21");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2015-10973");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2015-July/161722.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "FC21")
{

  if ((res = isrpmvuln(pkg:"wesnoth", rpm:"wesnoth~1.12.4~1.fc21", rls:"FC21")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
