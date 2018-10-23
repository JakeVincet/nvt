###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-078.nasl 8296 2018-01-05 07:28:01Z teissa $
#
# OpenType Font (OTF) Format Driver Privilege Elevation Vulnerabilities (2279986)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could allow attackers to execute arbitrary code
  with kernel privileges.
  Impact Level: System";
tag_affected = "Microsoft Windows XP  Service Pack 3 and prior.
  Microsoft Windows 2K3 Service Pack 2 and prior.";
tag_insight = "The flaws are due to an error in the OpenType Font (OTF) format
  driver,
  - It does not properly allocate memory when parsing a specially crafted font.
  - It does not properly perform an integer calculation when processing specially
    crafted OpenType fonts.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/MS10-078.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS10-078.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902320");
  script_version("$Revision: 8296 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-05 08:28:01 +0100 (Fri, 05 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-10-13 17:10:12 +0200 (Wed, 13 Oct 2010)");
  script_cve_id("CVE-2010-2740", "CVE-2010-2741");
  script_bugtraq_id(43779, 43778);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("OpenType Font (OTF) Format Driver Privilege Elevation Vulnerabilities (2279986)");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/2625");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS10-078.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, win2003:3) <= 0){
  exit(0);
}

## MS10-078 Hotfix check
if(hotfix_missing(name:"2279986") == 0){
  exit(0);
}

sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                          item:"Install Path");
if(!sysPath){
  exit(0);
}

share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:sysPath);
file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1",
                    string:sysPath + "\Atmfd.dll");
dllVer = GetVer(file:file, share:share);
if(!dllVer){
  exit(0);
}

## Windows XP
else if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
     ## Grep for Atmfd.dll version < 5.1.2.229
     if(version_is_less(version:dllVer, test_version:"5.1.2.229")){
       security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

# Windows 2003
else if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Grep for Atmfd.dll version < 5.2.2.229
    if(version_is_less(version:dllVer, test_version:"5.2.2.229")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}
