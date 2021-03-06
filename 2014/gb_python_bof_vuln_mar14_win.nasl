###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_python_bof_vuln_mar14_win.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# Python 'socket.recvfrom_into' Buffer Overflow Vulnerability Mar14 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:python:python";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804322");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2014-1912");
  script_bugtraq_id(65379);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-03-05 12:18:28 +0530 (Wed, 05 Mar 2014)");
  script_name("Python 'socket.recvfrom_into' Buffer Overflow Vulnerability Mar14 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Python and is prone to buffer overflow
vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Flaw is due to a boundary error within the 'sock_recvfrom_into' function.");
  script_tag(name:"impact", value:"Successful exploitation will allow a remote attacker to cause a buffer
overflow, resulting in a denial of service or potentially allowing the
execution of arbitrary code.");
  script_tag(name:"affected", value:"Python version 2.5 before 2.7.7 and 3.x before 3.3.4");
  script_tag(name:"solution", value:"Upgrade to Python version 2.7.7, 3.3.4 or later.

*****
NOTE: Ignore this warning if patch is already applied.
*****");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://bugs.python.org/issue20246");
  script_xref(name:"URL", value:"http://secunia.com/advisories/56624");
  script_xref(name:"URL", value:"http://pastebin.com/raw.php?i=GHXSmNEg");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/31875");
  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1029831");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_python_detect_win.nasl");
  script_mandatory_keys("Python6432/Win/Installed");
  script_xref(name:"URL", value:"http://bugs.python.org/issue20246");
  script_xref(name:"URL", value:"http://www.python.org/download/");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!pyVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:pyVer, test_version:"2.5", test_version2:"2.7.6150")||
   version_in_range(version:pyVer, test_version:"3.0", test_version2:"3.3.3150"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}
