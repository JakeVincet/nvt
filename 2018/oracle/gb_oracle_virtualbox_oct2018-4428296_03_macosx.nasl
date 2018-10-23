###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_oct2018-4428296_03_macosx.nasl 11941 2018-10-17 12:58:16Z santu $
#
# Oracle VirtualBox Security Updates (oct2018-4428296)-MAC OS X
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

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814266");
  script_version("$Revision: 11941 $");
  script_cve_id("CVE-2018-3287", "CVE-2018-0732", "CVE-2018-2909", "CVE-2018-3290",
                "CVE-2018-3291", "CVE-2018-3292", "CVE-2018-3293", "CVE-2018-3294",
                "CVE-2018-3295", "CVE-2018-3296", "CVE-2018-3297", "CVE-2018-3298",
                "CVE-2018-3289", "CVE-2018-3288");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-17 14:58:16 +0200 (Wed, 17 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-17 12:26:38 +0530 (Wed, 17 Oct 2018)");
  script_name("Oracle VirtualBox Security Updates (oct2018-4428296) 03 - MAC OS X");

  script_tag(name:"summary", value:"The host is installed with Oracle VM
  VirtualBox and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is
  present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to multiple
  unspecified errors within 'Core' component of Oracle VM VirtualBox.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attackers to gain elevated privileges on  the host system and complete
  takeover of the Oracle VM VirtualBox.");

  script_tag(name:"affected", value:"VirtualBox versions Prior to 5.2.20 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Oracle VirtualBox 5.2.20 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.oracle.com/technetwork/security-advisory/cpuoct2018-4428296.html#AppendixOVIR");
  script_xref(name:"URL", value:"https://www.oracle.com/in/virtualization/virtualbox/index.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_oracle_virtualbox_detect_macosx.nasl");
  script_mandatory_keys("Oracle/VirtualBox/MacOSX/Version");
  script_xref(name:"URL", value:"https://www.virtualbox.org");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE)) exit(0);
virtualVer = infos['version'];
path = infos['location'];

if(virtualVer =~ "^(5\.2)")
{
  if(version_is_less(version:virtualVer, test_version:"5.2.20"))
  {
    report = report_fixed_ver(installed_version:virtualVer, fixed_version: "5.2.20", install_path:path);
    security_message(data:report);
    exit(0);
  }
}
exit(99);
