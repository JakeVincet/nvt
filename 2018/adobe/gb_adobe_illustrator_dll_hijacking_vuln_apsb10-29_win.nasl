###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_illustrator_dll_hijacking_vuln_apsb10-29_win.nasl 10492 2018-07-12 13:42:55Z santu $
#
# Adobe Illustrator 'DLL Hijacking' RCE Vulnerability-Windows (apsb10-29)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:adobe:illustrator";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813260");
  script_version("$Revision: 10492 $");
  script_cve_id("CVE-2010-3152");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-07-12 15:42:55 +0200 (Thu, 12 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-12 15:32:37 +0530 (Thu, 12 Jul 2018)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Adobe Illustrator 'DLL Hijacking' RCE Vulnerability-Windows (apsb10-29)");

  script_tag(name: "summary" , value:"The host is installed with Adobe Illustrator
  and is prone to a 'DLL Hijacking' remote code execution vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to an error where
  application allows specially crafted file to be created and load instead
  of the intended DLL");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code on the affected system.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Illustrator before CS5 15.0.2 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Adobe Illustrator CS5 15.0.2
  or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://www.adobe.com/support/security/bulletins/apsb10-29.html");
  script_xref(name : "URL" , value : "https://www.adobe.com");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_adobe_illustrator_detect_win.nasl");
  script_mandatory_keys("Adobe/Illustrator/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
adobeVer = infos['version'];
adobePath = infos['location'];

if(version_in_range(version:adobeVer, test_version:"15.0", test_version2:"15.0.1"))
{
  report = report_fixed_ver(installed_version:adobeVer, fixed_version:"15.0.2", install_path:adobePath);
  security_message(data: report);
  exit(0);
}
exit(99);