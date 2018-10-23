###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_streamripper_mult_bof_vuln_nov08_lin.nasl 9349 2018-04-06 07:02:25Z cfischer $
#
# Streamripper Multiple Buffer Overflow Vulnerabilities (Linux)
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

tag_impact = "Successful attack could lead to execution of arbitrary code by tricking a
  user into connecting to a malicious server or can even cause denial of
  service condition.
  Impact Level: Application";
tag_affected = "Streamripper Version 1.63.5 and earlier on Linux.";
tag_insight = "The flaws are due to boundary error within,
  - http_parse_sc_header() function in lib/http.c, when parsing an overly long
    HTTP header starting with Zwitterion v.
  - http_get_pls() and http_get_m3u() functions in lib/http.c, when parsing a
    specially crafted pls playlist containing an overly long entry or m3u
    playlist containing an overly long File entry.";
tag_solution = "Upgrade to Version 1.64.0,
  http://streamripper.sourceforge.net/";
tag_summary = "The host is installed with Streamripper, which is prone to Multiple
  Buffer Overflow Vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800147");
  script_version("$Revision: 9349 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:02:25 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2008-12-01 15:31:19 +0100 (Mon, 01 Dec 2008)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-4829");
  script_bugtraq_id(32356);
  script_name("Streamripper Multiple Buffer Overflow Vulnerabilities (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/32562");
  script_xref(name : "URL" , value : "http://www.frsirt.com/english/advisories/2008/3207");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_mandatory_keys("login/SSH/success");
  script_dependencies("gather-package-list.nasl");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("ssh_func.inc");
include("version_func.inc");

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

binPaths = find_bin(prog_name:"streamripper", sock:sock);
foreach srBin (binPaths)
{
  if( chomp(srBin) == "" ) continue;
  srVer = get_bin_version(full_prog_name:chomp(srBin), version_argv:"-v",
                          ver_pattern:"Streamripper ([0-9.]+)", sock:sock);
  if(srVer[1] != NULL )
  {
    if(version_is_less(version:srVer[1], test_version:"1.64.0")){
      security_message(0);
    }
    ssh_close_connection();
    exit(0);
  }
}
ssh_close_connection();
