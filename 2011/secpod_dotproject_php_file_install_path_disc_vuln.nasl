###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_dotproject_php_file_install_path_disc_vuln.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# dotProject '.php' Files Installation Path Disclosure Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902733");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-09-30 15:58:03 +0200 (Fri, 30 Sep 2011)");
  script_cve_id("CVE-2011-3729");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("dotProject '.php' Files Installation Path Disclosure Vulnerability");
  script_xref(name:"URL", value:"https://www.infosecisland.com/alertsview/16750-CVE-2011-3729-dotproject.html");
  script_xref(name:"URL", value:"http://code.google.com/p/inspathx/source/browse/trunk/paths_vuln/dotproject-2.1.4");
  script_xref(name:"URL", value:"http://securityswebblog.blogspot.com/2011/09/vulnerability-summary-for-cve-2011-3729.html");

  script_tag(name:"qod_type", value:"remote_active");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("gb_dotproject_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to gain sensitive
information.");
  script_tag(name:"affected", value:"dotProject version 2.1.4");
  script_tag(name:"insight", value:"The flaw is due to error in certain '.php' files. A direct
request to these files reveals the installation path in an error message.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"The host is running dotProject and is prone to path disclosure
vulnerability.");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");

dpPort = get_http_port(default:80);
if(!dpPort){
  exit(0);
}

if(!can_host_php(port:dpPort)) {
  exit(0);
}

dotDir = get_dir_from_kb(port:dpPort,app:"dotProject");
if(!dotDir){
  exit(0);
}

url = dotDir + "/fileviewer.php";

if(http_vuln_check(port:dpPort, url:url, pattern:"<b>Fatal error</b>:  Call" +
                 " to undefined method.*fileviewer.php")){
  security_message(port:dpPort);
}
