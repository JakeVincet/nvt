###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_apr2017-3236618_03_win.nasl 11989 2018-10-19 11:25:26Z cfischer $
#
# Oracle Mysql Security Updates (apr2017-3236618) 03 - Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:oracle:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810884");
  script_version("$Revision: 11989 $");
  script_cve_id("CVE-2017-3305");
  script_bugtraq_id(97023);
  script_tag(name:"cvss_base", value:"6.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 13:25:26 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-19 16:45:28 +0530 (Wed, 19 Apr 2017)");
  script_name("Oracle Mysql Security Updates (apr2017-3236618) 03 - Windows");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to a security bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an incorrect
  implementation or enforcement of 'ssl-mode=REQUIRED' in MySQL.");

  script_tag(name:"impact", value:"Successful exploitation of this vulnerability
  will allow remote attackers to bypass certain security restrictions and perform
  unauthorized actions by conducting a man-in-the-middle attack. This may lead to
  other attacks also.");

  script_tag(name:"affected", value:"Oracle MySQL version 5.5.54 and earlier,
  5.6.35 and earlier on Windows");

  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpuapr2017-3236618.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed", "Host/runs_windows");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sqlPort = get_app_port(cpe:CPE))
{
  CPE = "cpe:/a:mysql:mysql";
  if(!sqlPort = get_app_port(cpe:CPE)){
    exit(0);
  }
}

if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.54") ||
   version_in_range(version:mysqlVer, test_version:"5.6", test_version2:"5.6.35"))
{
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch");
  security_message(data:report, port:sqlPort);
  exit(0);
}
