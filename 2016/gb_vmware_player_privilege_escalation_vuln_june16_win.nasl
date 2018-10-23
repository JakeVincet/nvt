###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vmware_player_privilege_escalation_vuln_june16_win.nasl 11640 2018-09-27 07:15:20Z asteins $
#
# VMware Player Privilege Escalation vulnerability June16 (Windows)
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

CPE = "cpe:/a:vmware:player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808110");
  script_version("$Revision: 11640 $");
  script_cve_id("CVE-2016-2077");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 09:15:20 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-06-03 17:28:32 +0530 (Fri, 03 Jun 2016)");
  script_tag(name:"qod_type", value:"registry");
  script_name("VMware Player Privilege Escalation vulnerability June16 (Windows)");

  script_tag(name:"summary", value:"The host is installed with VMware Player
  and is prone to privilege escalation vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to incorrectly accessing
  an executable file.");

  script_tag(name:"impact", value:"Successful exploitation will allow host
  OS users to gain host OS privileges.");

  script_tag(name:"affected", value:"VMware Player 7.x prior to version 7.1.3
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to VMware Player version
  7.1.3 or later, For updates refer to http://www.vmware.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www.vmware.com/security/advisories/VMSA-2016-0005.html");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_vmware_prdts_detect_win.nasl");
  script_mandatory_keys("VMware/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!vmwareVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(vmwareVer =~ "^7\.")
{
  if(version_is_less(version:vmwareVer, test_version:"7.1.3"))
  {
    report = report_fixed_ver(installed_version:vmwareVer, fixed_version:"7.1.3");
    security_message(data:report);
    exit(0);
  }
}
