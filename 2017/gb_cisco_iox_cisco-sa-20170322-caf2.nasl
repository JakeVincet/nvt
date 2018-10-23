###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_iox_cisco-sa-20170322-caf2.nasl 11982 2018-10-19 08:49:21Z mmartin $
#
# Cisco Application-Hosting Framework Arbitrary File Creation Vulnerability
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
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:cisco:iox";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106692");
  script_cve_id("CVE-2017-3852");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:P");
  script_version("$Revision: 11982 $");

  script_name("Cisco Application-Hosting Framework Arbitrary File Creation Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170322-iox");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"Update to version 1.2.4.2");

  script_tag(name:"summary", value:"A vulnerability in the Cisco application-hosting framework (CAF) component
of the Cisco IOx application environment could allow an authenticated, remote attacker to write or modify
arbitrary files in the virtual instance running on the affected device.");

  script_tag(name:"insight", value:"The vulnerability is due to insufficient input validation of user-supplied
application packages. An attacker who can upload a malicious package within Cisco IOx could exploit the
vulnerability to modify arbitrary files.");

  script_tag(name:"impact", value:"The impacts of a successful exploit are limited to the scope of the virtual
instance and do not impact the router that is hosting Cisco IOx.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-19 10:49:21 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-23 09:56:15 +0700 (Thu, 23 Mar 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_iox_web_detect.nasl");
  script_mandatory_keys("cisco_iox/installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE, service: "www"))
  exit(0);

if (version == '1.1.0.0' || version == '1.0.0.0') {
  report = report_fixed_ver(installed_version: version, fixed_version: "1.2.4.2");
  security_message(port: 0, data: report);
  exit(0);
}

exit(99);

