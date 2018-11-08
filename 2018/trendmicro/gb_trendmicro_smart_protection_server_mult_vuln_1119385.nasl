###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_trendmicro_smart_protection_server_mult_vuln_1119385.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Trend Micro Smart Protection Server Multiple Vulnerabilities (1119385)
#
# Authors:
# Antu Sanadi <santusecpod.com>
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

CPE = "cpe:/a:trendmicro:smart_protection_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812574");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-6231");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-03-20 10:56:21 +0530 (Tue, 20 Mar 2018)");
  script_name("Trend Micro Smart Protection Server Multiple Vulnerabilities (1119385)");

  script_tag(name:"summary", value:"This host is running Trend Micro Smart
  Protection Server and is prone to command injection  and authentication
  bypass vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaws exists within the handling
  of credentials provided at login. When parsing the username, the process
  does not properly validate a user-supplied string before using it to
  execute a system call.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attackers to escalate privileges to resources normally protected from
  the user.");

  script_tag(name:"affected", value:"Trend Micro Smart Protection Server (Standalone) 3.2 and prior.");

  script_tag(name:"solution", value:"Upgrade to Trend Micro Smart Protection
  Server 3.3 CP1076, 3.2 CP1090, 3.1 CP1064, 3.0 CP1355 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  ## Patch version is not available remotely
  script_xref(name:"URL", value:"https://success.trendmicro.com/solution/1119385");
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web Servers");
  script_dependencies("gb_trendmicro_smart_protection_server_detect.nasl");
  script_mandatory_keys("trendmicro/SPS/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!tspPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:tspPort, exit_no_version:TRUE);
tspsVer = infos['version'];
path = infos['location'];

if(version_is_less_equal(version:tspsVer, test_version:"3.0")){
  fix = "3.0 CP1355";
}
else if(tspsVer == "3.1"){
  fix = "3.1 CP1064";
}
else if(tspsVer == "3.2"){
  fix = "3.2 CP1090";
}
else if(tspsVer == "3.3"){
  fix = "3.3 CP1076";
}

if(fix)
{
  report = report_fixed_ver(installed_version:tspsVer, fixed_version:fix,  install_path:path);
  security_message(data:report, port:tspPort);
  exit(0);
}
