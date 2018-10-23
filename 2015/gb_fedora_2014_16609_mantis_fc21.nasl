###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for mantis FEDORA-2014-16609
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
  script_oid("1.3.6.1.4.1.25623.1.0.868796");
  script_version("$Revision: 6630 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:34:32 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-01-05 14:52:20 +0100 (Mon, 05 Jan 2015)");
  script_cve_id("CVE-2014-9280", "CVE-2014-9279", "CVE-2014-6316", "CVE-2014-9117",
                "CVE-2014-9089", "CVE-2014-7146", "CVE-2014-8598", "CVE-2014-8554",
                "CVE-2014-9272", "CVE-2014-9281", "CVE-2014-9270", "CVE-2014-9269",
                "CVE-2014-8987", "CVE-2014-8988", "CVE-2014-8986");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Fedora Update for mantis FEDORA-2014-16609");
  script_tag(name: "summary", value: "Check the version of mantis");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Mantis is a free popular web-based issue tracking system.
It is written in the PHP scripting language and works with MySQL, MS SQL,
and PostgreSQL databases and a web server.
Almost any web browser should be able to function as a client.

Documentation can be found in: /usr/share/doc/mantis

When the package has finished installing, you will need to perform some
additional configuration steps  these are described in:
/usr/share/doc/mantis/README.Fedora
");
  script_tag(name: "affected", value: "mantis on Fedora 21");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2014-16609");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-December/146599.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
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

  if ((res = isrpmvuln(pkg:"mantis", rpm:"mantis~1.2.18~1.fc21", rls:"FC21")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
