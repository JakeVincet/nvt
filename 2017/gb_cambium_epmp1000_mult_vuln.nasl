###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cambium_epmp1000_mult_vuln.nasl 11977 2018-10-19 07:28:56Z mmartin $
#
# Cambium Networks ePMP 1000 Multiple Vulnerabilities
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

CPE = "cpe:/a:cambium_networks:epmp1000";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106628");
  script_version("$Revision: 11977 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 09:28:56 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-03 10:33:24 +0700 (Fri, 03 Mar 2017)");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Cambium Networks ePMP 1000 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_cambium_epmp1000_detect.nasl");
  script_mandatory_keys("epmp1000/detected");

  script_tag(name:"summary", value:"Cambium Networks ePMP1000 is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"insight", value:"Multiple vulnerabilities have been found in ePMP 1000:

  - OS command injection

  - Weak Authorization Controls + privilege escalation");

  script_tag(name:"solution", value:"Upgrade to version 2.5 or later.");

  script_xref(name:"URL", value:"https://ipositivesecurity.blogspot.in/2015/11/cambium-epmp-1000-multiple.html");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "2.5")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.5");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
