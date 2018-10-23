###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_arbitrary_code_exec_vuln_feb16.nasl 11614 2018-09-26 07:39:28Z asteins $
#
# IBM Websphere Apllication Server Arbitrary Code Execution Vulnerability Feb16
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:ibm:websphere_application_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806874");
  script_version("$Revision: 11614 $");
  script_cve_id("CVE-2015-1920");
  script_bugtraq_id(74439);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-26 09:39:28 +0200 (Wed, 26 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-02-19 09:55:23 +0530 (Fri, 19 Feb 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("IBM Websphere Apllication Server Arbitrary Code Execution Vulnerability Feb16");

  script_tag(name:"summary", value:"This host is installed with IBM Websphere
  application server and is prone to arbitrary code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to

  - An unspecified error in 'Management port'.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code.");

  script_tag(name:"affected", value:"IBM WebSphere Application Server (WAS)
  6.1 through 6.1.0.47, 7.0 before 7.0.0.39, 8.0 before 8.0.0.11, and 8.5
  before 8.5.5.6");

  script_tag(name:"solution", value:"Upgrade to IBM WebSphere Application
  Server (WAS) version 6.1.0.48, 7.0.0.39, 8.0.0.11, or 8.5.5.6, or later,
  For updates refer to http://www-03.ibm.com/software/products/en/appserv-was");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21883573");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ibm_websphere_detect.nasl");
  script_mandatory_keys("ibm_websphere_application_server/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!wasPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!wasVer = get_app_version(cpe:CPE, port:wasPort)){
  exit(0);
}

if(version_in_range(version:wasVer, test_version:"6.1", test_version2:"6.1.0.47"))
{
  fix = "6.1.0.48";
  VULN = TRUE;
}

else if(version_in_range(version:wasVer, test_version:"7.0", test_version2:"7.0.0.38"))
{
  fix = "7.0.0.39";
  VULN = TRUE;
}

else if(version_in_range(version:wasVer, test_version:"8.0", test_version2:"8.0.0.10"))
{
  fix = "8.0.0.11";
  VULN = TRUE;
}

else if(version_in_range(version:wasVer, test_version:"8.5", test_version2:"8.5.5.5"))
{
  fix = "8.5.5.6";
  VULN = TRUE;
}

if(VULN)
{
  report = report_fixed_ver(installed_version:wasVer, fixed_version:fix);
  security_message(data:report, port:wasPort);
  exit(0);
}