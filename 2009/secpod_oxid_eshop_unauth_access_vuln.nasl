###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_oxid_eshop_unauth_access_vuln.nasl 11088 2018-08-23 07:30:11Z ckuersteiner $
#
# OXID eShop Community Edition Unauthorized Access Vulnerability
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:oxid:eshop";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900934");
  script_version("$Revision: 11088 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-23 09:30:11 +0200 (Thu, 23 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-09-11 18:01:06 +0200 (Fri, 11 Sep 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2009-2266");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("OXID eShop Community Edition Unauthorized Access Vulnerability");

  script_xref(name:"URL", value:"http://en.securitylab.ru/nvd/385002.php");
  script_xref(name:"URL", value:"http://www.oxidforge.org/wiki/Security_bulletins/2009-003");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_oxid_eshop_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("oxid_eshop/installed");

  script_tag(name:"impact", value:"Attackers can exploit this issue via specially crafted cookies to gain
  unauthorized access to session information of unregistered users.
  Impact Level: Application");

  script_tag(name:"affected", value:"OXID eShop Community Edition version 4.x through 4.1.3");

  script_tag(name:"insight", value:"User supplied data passed to an unspecified variable is not sanitised
  before processing.");

  script_tag(name:"solution", value:"Upgrade to version 4.1.4
  http://www.oxidforge.org/wiki/Category:Downloads");

  script_tag(name:"summary", value:"This host is installed with OXID eShop and is prone to
  unauthorized access vulnerability.");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version: version, test_version:"4.0", test_version2:"4.1.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.1.4");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
