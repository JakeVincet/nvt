###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_postgresql_mult_vuln_april16_lin.nasl 7545 2017-10-24 11:45:30Z cfischer $
#
# PostgreSQL Multiple Vulnerabilities - Apr16 (Linux)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:postgresql:postgresql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807321");
  script_version("$Revision: 7545 $");
  script_cve_id("CVE-2016-3065", "CVE-2016-2193");
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-04-26 17:44:57 +0530 (Tue, 26 Apr 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("PostgreSQL Multiple Vulnerabilities - Apr16 (Linux)");
  
  script_tag(name:"summary", value:"This host is running PostgreSQL and is
  prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,
  - An error in the 'brin_page_type' and 'brin_metapage_info' functions in
    the pageinspect extension.
  - PostgreSQL does not properly maintain row-security status in cached
    plans.");

  script_tag(name:"impact", value:"Successful exploitation will allows
  attackers to bypass intended access restrictions, to obtain sensitive 
  server memory information and to cause a denial of service.

  Impact Level: Application");

  script_tag(name:"affected", value:"PostgreSQL version 9.5.x before
  9.5.2 on Linux.");

  script_tag(name:"solution", value:"Upgrade to version 9.5.2 or higher,
  For updates refer to http://www.postgresql.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.postgresql.org/docs/current/static/release-9-5-2.html");
  script_xref(name : "URL" , value : "http://www.postgresql.org/about/news/1656/");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("postgresql_detect.nasl","os_detection.nasl");
  script_require_ports("Services/postgresql", 5432);
  script_mandatory_keys("PostgreSQL/installed","Host/runs_unixoide");
  exit(0);
}


include("misc_func.inc");
include("version_func.inc");
include("host_details.inc");

## Variable Initialization
pgsqlPort = "";
pgsqlVer = "";

## Get the default port
pgsqlPort = get_app_port(cpe:CPE);
if(!pgsqlPort){
  exit(0);
}

## Get the PostgreSQL version
pgsqlVer = get_app_version(cpe:CPE, port:pgsqlPort);
if(isnull(pgsqlVer)){
  exit(0);
}

## Grep for vulnerable version
if(version_in_range(version:pgsqlVer, test_version:"9.5.0", test_version2:"9.5.1"))
{
  report = report_fixed_ver(installed_version:pgsqlVer, fixed_version:"9.5.2");
  security_message(data:report, port:pgsqlPort);
  exit(0);
}

exit(99);