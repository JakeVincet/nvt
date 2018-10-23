###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms17-018.nasl 11879 2018-10-12 12:48:49Z mmartin $
#
# Microsoft Windows Kernel-Mode Drivers Privilege Elevation Vulnerabilities (4013083)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810594");
  script_version("$Revision: 11879 $");
  script_cve_id("CVE-2017-0024", "CVE-2017-0026", "CVE-2017-0056", "CVE-2017-0078",
                "CVE-2017-0079", "CVE-2017-0080", "CVE-2017-0081", "CVE-2017-0082");
  script_bugtraq_id(96029, 96032, 96630, 96631, 96632, 96633, 96634, 96635);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:48:49 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-15 08:10:02 +0530 (Wed, 15 Mar 2017)");
  script_name("Microsoft Windows Kernel-Mode Drivers Privilege Elevation Vulnerabilities (4013083)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS17-018.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists when the Windows
  kernel-mode driver fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in kernel mode. An attacker could then:

  - install programs

  - view, change, or delete data

  - create new accounts with full user rights.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x32/x64 Edition

  Microsoft Windows 10 x32/x64

  Microsoft Windows Server 2012/2012R2

  Microsoft Windows 10 Version 1511 x32/x64

  Microsoft Windows 10 Version 1607 x32/x64

  Microsoft Windows Vista x32/x64 Edition Service Pack 2

  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2

  Microsoft Windows 7 x32/x64 Edition Service Pack 1

  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1

  Microsoft Windows Server 2016.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/4013083");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS17-018");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS17-018");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2, winVistax64:3,
                   win2008x64:3, win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1,
                   win10x64:1, win2016:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

winVer = fetch_file_version(sysPath:sysPath, file_name:"System32\Win32k.sys");
gdiVer = fetch_file_version(sysPath:sysPath, file_name:"System32\Gdi32.dll");

if(!winVer && !gdiVer){
  exit(0);
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0 && gdiVer)
{
  ## Presently GDR information is not available.
  if(version_is_less(version:gdiVer, test_version:"6.1.7601.23688"))
  {
    Vulnerable_range1 = "Less than 6.1.7601.23688";
    VULN1 = TRUE ;
  }
}

else if(hotfix_check_sp(winVista:3, winVistax64:3, win2008:3, win2008x64:3) > 0 && winVer)
{
  if(version_is_less(version:winVer, test_version:"6.0.6002.19741"))
  {
    Vulnerable_range = "Less than 6.0.6002.19741";
    VULN = TRUE ;
  }

  else if(version_in_range(version:winVer, test_version:"6.0.6002.24000", test_version2:"6.0.6002.24064"))
  {
    Vulnerable_range = "6.0.6002.24000 - 6.0.6002.24064";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win2012:1) > 0 && gdiVer)
{
  if(version_is_less(version:gdiVer, test_version:"6.2.9200.22082"))
  {
     Vulnerable_range1 = "Less than 6.2.9200.22082";
     VULN1 = TRUE ;
  }
}

## Win 8.1 and win2012R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0 && gdiVer)
{
  if(version_is_less(version:gdiVer, test_version:"6.3.9600.18592"))
  {
    Vulnerable_range1 = "Less than 6.3.9600.18592";
    VULN1 = TRUE ;
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0 && gdiVer)
{
  if(version_is_less(version:gdiVer, test_version:"10.0.10240.17319"))
  {
    Vulnerable_range1 = "Less than 10.0.10240.17319";
    VULN1 = TRUE;
  }

  else if(version_in_range(version:gdiVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.838"))
  {
    Vulnerable_range1 = "10.0.10586.0 - 10.0.10586.838";
    VULN1 = TRUE ;
  }

  else if(version_in_range(version:gdiVer, test_version:"10.0.14393.0", test_version2:"10.0.14393.205"))
  {
    Vulnerable_range1 = "10.0.14393.0 - 10.0.14393.205";
    VULN1 = TRUE ;
  }
}

else if(hotfix_check_sp(win2016:1) > 0 && gdiVer)
{
  if(version_in_range(version:gdiVer, test_version:"10.0.14393.0", test_version2:"10.0.14393.205"))
  {
    Vulnerable_range1 = "10.0.14393.0 - 10.0.14393.205";
    VULN1 = TRUE ;
  }
}

if(VULN1)
{
  report = 'File checked:     ' + sysPath + "\System32\Gdi32.dll" + '\n' +
           'File version:     ' + gdiVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range1 + '\n' ;
  security_message(data:report);
  exit(0);
}

else if(VULN)
{
  report = 'File checked:     ' + sysPath + "\System32\Win32k.sys" + '\n' +
           'File version:     ' + winVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
