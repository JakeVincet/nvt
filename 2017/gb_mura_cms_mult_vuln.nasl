###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mura_cms_mult_vuln.nasl 11977 2018-10-19 07:28:56Z mmartin $
#
# Mura CMS Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = "cpe:/a:blueriver:mura_cms";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106788");
  script_version("$Revision: 11977 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 09:28:56 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-25 08:10:42 +0200 (Tue, 25 Apr 2017)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Mura CMS Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_mura_cms_detect.nasl");
  script_mandatory_keys("mura_cms/installed");

  script_tag(name:"summary", value:"Mura CMS is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Mura CMS is prone to multiple vulnerabilities:

  - Unauthenticated remote arbitrary code execution

  - Unrestricted file upload");

  script_tag(name:"impact", value:"An unauthenticated attacker may execute arbitrary code.");

  script_tag(name:"affected", value:"Mura CMS prior to version 7.0.6852.");

  script_tag(name:"solution", value:"Update to version 7.0.6852 or later.");

  script_xref(name:"URL", value:"http://www.getmura.com/blog/critical-security-update-for-mura-cms-all-versions-prior-to-7-0-6852/");
  script_xref(name:"URL", value:"https://blogs.securiteam.com/index.php/archives/2955");


  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "7.0.6852")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "7.0.6852");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
