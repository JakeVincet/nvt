###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-048.nasl 11837 2018-10-11 09:17:05Z asteins $
#
# Microsoft Windows CSRSS Feature Bypass Vulnerability (3148528)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807790");
  script_version("$Revision: 11837 $");
  script_cve_id("CVE-2016-0151");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 11:17:05 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-04-13 08:06:29 +0530 (Wed, 13 Apr 2016)");
  script_name("Microsoft Windows CSRSS Feature Bypass Vulnerability (3148528)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-048");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists in Microsoft Windows when the
  Client-Server Run-time Subsystem (CSRSS) fails to properly manage process
  tokens in memory");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to execute arbitrary code as an administrator.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows 10 x32/x64
  Microsoft Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3146723");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3147461");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3147458");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-048");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1,
                   win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

sysVer = fetch_file_version(sysPath, file_name:"System32\Ntoskrnl.exe");
if(!sysVer){
  exit(0);
}


if(sysVer =~ "^(6\.3\.9600\.1)"){
  Vulnerable_range = "Less than 6.3.9600.18258";
}
else if (sysVer =~ "^(6\.2\.9200\.2)"){
  Vulnerable_range = "Less than 6.2.9200.21821";
}

if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:sysVer, test_version:"6.3.9600.18258")){
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win2012:1) > 0)
{
  if(version_is_less(version:sysVer, test_version:"6.2.9200.21821")){
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:sysVer, test_version:"10.0.10240.16724"))
  {
    Vulnerable_range = "10.0.10240.16724";
    VULN = TRUE ;
  }
  else if(version_in_range(version:sysVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.211"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.211";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\system32\Ntoskrnl.exe" + '\n' +
           'File version:     ' + sysVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
