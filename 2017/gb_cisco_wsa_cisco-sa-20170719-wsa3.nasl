###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_wsa_cisco-sa-20170719-wsa3.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# Cisco Web Security Appliance Stored Cross-Site Scripting Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/h:cisco:web_security_appliance";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106973");
  script_cve_id("CVE-2017-6749");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_version("$Revision: 11874 $");

  script_name("Cisco Web Security Appliance Stored Cross-Site Scripting Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170719-wsa3");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the web-based management interface of Cisco Web Security
Appliance (WSA) could allow an authenticated, remote attacker to conduct a stored cross-site scripting (XSS)
attack against a user of the web-based management interface of an affected device.");

  script_tag(name:"insight", value:"The vulnerability is due to insufficient validation of user-supplied input
by the web-based management interface of an affected device. An attacker could exploit this vulnerability by
persuading a user of the interface to click a crafted link.");

  script_tag(name:"impact", value:"A successful exploit could allow the attacker to execute arbitrary script
code in the context of the interface or allow the attacker to access sensitive browser-based information.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-20 14:29:30 +0700 (Thu, 20 Jul 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_wsa_version.nasl");
  script_mandatory_keys("cisco_wsa/installed");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe:CPE))
  exit(0);

affected = make_list(
		'10.0.0-232',
		'10.0.0-233',
		'10.1.0',
		'10.1.0-204',
		'10.1.1-230',
		'10.1.1-234',
		'10.1.1-235',
		'10.5.0',
		'10.5.0-358',
		'10.5.1-270');

foreach af (affected) {
  if (version == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);

