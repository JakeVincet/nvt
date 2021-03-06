###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openoffice_senddoc_tmp_file_creation_vuln_win.nasl 5042 2017-01-19 14:57:19Z cfi $
#
# OpenOffice senddoc Insecure Temporary File Creation Vulnerability (Windows)
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800128");
  script_version("$Revision: 5042 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-19 15:57:19 +0100 (Thu, 19 Jan 2017) $");
  script_tag(name:"creation_date", value:"2008-11-11 09:00:11 +0100 (Tue, 11 Nov 2008)");
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:N/I:P/A:P");
  script_cve_id("CVE-2008-4937");
  script_bugtraq_id(30925);
  script_name("OpenOffice senddoc Insecure Temporary File Creation Vulnerability (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);

  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2008/10/30/2");

  tag_impact = "Successful exploitation allows attackers to delete or corrupt
  sensitive files, which may result in a denial of service condition.

  Impact Level: Application";

  tag_affected = "OpenOffice.org 2.4.1 on Windows (Any).";

  tag_insight = "The flaw exists due to OpenOffice 'senddoc' which creates temporary files in an
  insecure manner, that allows users to overwrite files via a symlink attack
  on a /tmp/log.obr.##### temporary file.";

  tag_solution = "Upgrade OpenOffice higher version.
  http://download.openoffice.org/index.html";

  tag_summary = "The host has OpenOffice installed and is prone to Insecure
  Temporary File Creation Vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("smb_nt.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
keys = registry_enum_keys(key:key);

foreach item (keys)
{
  if("OpenOffice.org" >< registry_get_sz(key:key + item, item:"DisplayName"))
  {
    openOffVer = registry_get_sz(key:key + item, item:"DisplayVersion");
    if(openOffVer == "2.4.9310"){
        security_message(0);
    }
    exit(0);
  }
}
