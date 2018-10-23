###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_tiv_endpoint_manager_xxe_vuln.nasl 11523 2018-09-21 13:37:35Z asteins $
#
# IBM Tivoli Endpoint Manager XML External Entity Injection Vulnerability
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

CPE = "cpe:/a:ibm:tivoli_endpoint_manager";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809367");
  script_version("$Revision: 11523 $");
  script_cve_id("CVE-2014-3066");
  script_bugtraq_id(78017);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 15:37:35 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-10-18 13:23:56 +0530 (Tue, 18 Oct 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("IBM Tivoli Endpoint Manager XML External Entity Injection Vulnerability");

  script_tag(name:"summary", value:"This host is installed with IBM Tivoli
  Endpoint Manager and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is caused by an XML External Entity
  Injection (XXE) error when processing XML data.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to read arbitrary files via XML data containing an external entity
  declaration in conjunction with an entity reference.");

  script_tag(name:"affected", value:"IBM Tivoli Endpoint Manager versions
  9.1 prior to 9.1.1088.0");

  script_tag(name:"solution", value:"Upgrade to IBM Tivoli Endpoint Manager
  version 9.1.1088.0, or later,
  For updates refer to http://www-03.ibm.com/software/products/en/endpoint-manager-family");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21673951");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ibm_endpoint_manager_web_detect.nasl");
  script_mandatory_keys("ibm_endpoint_manager/installed");
  script_require_ports("Services/www", 52311);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!tivPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!tivVer = get_app_version(cpe:CPE, port:tivPort)){
  exit(0);
}

if(version_in_range(version:tivVer, test_version:"9.1", test_version2:"9.1.1087.0"))
{
  report = report_fixed_ver(installed_version:tivVer, fixed_version:"9.1.1088.0");
  security_message(port:tivPort, data:report);
  exit(0);
}
