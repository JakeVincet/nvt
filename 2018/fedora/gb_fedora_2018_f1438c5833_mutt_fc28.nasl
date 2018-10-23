###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_f1438c5833_mutt_fc28.nasl 11416 2018-09-17 03:39:26Z ckuersteiner $
#
# Fedora Update for mutt FEDORA-2018-f1438c5833
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.874878");
  script_version("$Revision: 11416 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-17 05:39:26 +0200 (Mon, 17 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-02 06:03:48 +0200 (Thu, 02 Aug 2018)");
  script_cve_id("CVE-2018-14358", "CVE-2018-14352", "CVE-2018-14353", "CVE-2018-14356", 
                "CVE-2018-14359", "CVE-2018-14354", "CVE-2018-14355", "CVE-2018-14362", 
                "CVE-2018-14357", "CVE-2018-14350", "CVE-2018-14349", "CVE-2018-14351");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mutt FEDORA-2018-f1438c5833");
  script_tag(name:"summary", value:"Check the version of mutt");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Mutt is a small but very powerful text-based 
MIME mail client.  Mutt is highly configurable, and is well suited to the mail 
power user with advanced features like key bindings, keyboard macros, 
mail threading, regular expression searches and a powerful pattern matching 
language for selecting groups of messages.
");
  script_tag(name:"affected", value:"mutt on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-f1438c5833");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GAEYBSZPZ6PAWGFNHLCBPAKO6INA3JFQ");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"mutt", rpm:"mutt~1.10.1~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
