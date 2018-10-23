##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms08-065_900224.nasl 9349 2018-04-06 07:02:25Z cfischer $
# Description: Message Queuing Remote Code Execution Vulnerability (951071)
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
#
# Copyright:
# Copyright (C) 2008 SecPod, http://www.secpod.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
##############################################################################

tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link.
  http://www.microsoft.com/technet/security/Bulletin/MS08-065.mspx";

tag_impact = "Successful exploitation could allow remote code execution by
  sending a specially crafted RPC request and can take complete control
  of an affected system.
  Impact Level: System";
tag_affected = "Microsoft Windows 2000 Service Pack 4 and prior.";
tag_insight = "The flaw exists due to a boundary error when parsing RPC requests to the
  Message Queuing (MSMQ).";
tag_summary = "This host is missing important security update according to
  Microsoft Bulletin MS08-065.";


if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900224");
  script_version("$Revision: 9349 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:02:25 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2008-10-15 19:56:48 +0200 (Wed, 15 Oct 2008)");
  script_bugtraq_id(31637);
  script_cve_id("CVE-2008-3479");
  script_copyright("Copyright (C) 2008 SecPod");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_category(ACT_GATHER_INFO);
  script_family("Windows : Microsoft Bulletins");
  script_name("Message Queuing Remote Code Execution Vulnerability (951071)");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/Bulletin/MS08-065.mspx");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2k:5) <= 0){
  exit(0);
}

msmqIns = registry_get_sz(key:"SOFTWARE\Microsoft\MSMQ\Parameters",
                          item:"CurrentBuild");
if(!msmqIns){
  exit(0);
}

# Check for Hotfix 951071 (MS08-065).
if(hotfix_missing(name:"951071") == 0){
  exit(0);
}

# Get System32 Path
sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                          item:"Install Path");
if(!sysPath){
  exit(0);
}

exePath = sysPath + "\Mqsvc.exe";
share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:exePath);
file =  ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:exePath);

fileVer = GetVer(file:file, share:share);
if(fileVer == NULL){
  exit(0);
}

# Grep Mqsvc.exe version < 5.0.0.807
if(egrep(pattern:"^(5\.0\.0\.([0-7]?[0-9]?[0-9]|80[0-6]))$",
           string:fileVer)){
  security_message(0);
}
