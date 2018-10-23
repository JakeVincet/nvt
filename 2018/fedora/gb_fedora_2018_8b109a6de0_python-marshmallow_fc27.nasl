###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_8b109a6de0_python-marshmallow_fc27.nasl 11877 2018-10-12 12:31:50Z santu $
#
# Fedora Update for python-marshmallow FEDORA-2018-8b109a6de0
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
  script_oid("1.3.6.1.4.1.25623.1.0.875167");
  script_version("$Revision: 11877 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:31:50 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-11 08:44:10 +0200 (Thu, 11 Oct 2018)");
  script_cve_id("CVE-2018-17175");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for python-marshmallow FEDORA-2018-8b109a6de0");
  script_tag(name:"summary", value:"Check the version of python-marshmallow");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"Marshmallow is a framework-agnostic library
  for converting complex datatypes, such as objects, to and from primitive Python
  datatypes.

Marshmallow schemas can be used to:
* Validate input data.
* Deserialize input data to app-level objects.
* Serialize app-level objects to primitive Python types. The serialized objects
  can then be rendered to standard formats such as JSON for use in an HTTP API.
");
  script_tag(name:"affected", value:"python-marshmallow on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-8b109a6de0");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TFINYADGWBROY56DUE3RUK2FYDL7RBOR");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"python-marshmallow", rpm:"python-marshmallow~2.11.1~8.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
