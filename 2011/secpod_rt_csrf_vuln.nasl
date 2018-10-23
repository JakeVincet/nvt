###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_rt_csrf_vuln.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# RT (Request Tracker) Cross Site Request Forgery Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.902508");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-05-09 15:38:03 +0200 (Mon, 09 May 2011)");
  script_cve_id("CVE-2011-1685");
  script_bugtraq_id(47383);
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:P/A:P");
  script_name("RT (Request Tracker) Cross Site Request Forgery Vulnerability");
  script_xref(name:"URL", value:"http://secunia.com/advisories/44189");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/66791");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=696795");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("rt_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to execute arbitrary code with
  the permissions of the web server.");
  script_tag(name:"affected", value:"RT (Request Tracker) versions 3.8.0 through 3.8.9 and 4.0.0rc through 4.0.0rc7.");
  script_tag(name:"insight", value:"The flaw is caused by an error in the external custom field feature, which
  allows remote authenticated users to execute arbitrary code via unspecified
  vectors.");
  script_tag(name:"solution", value:"Upgrade to RT (Request Tracker) version 3.8.10 or 4.0.0rc8.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"This host is installed with Request Tracker and is prone to
  cross site request forgery vulnerability.");
  script_xref(name:"URL", value:"http://www.bestpractical.com/rt/");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port)) {
  exit(0);
}

if(!can_host_php(port:port)){
  exit(0);
}

if(vers = get_version_from_kb(port:port,app:"rt_tracker"))
{
  if(version_in_range(version:vers, test_version:"3.8.0", test_version2:"3.8.9") ||
     version_in_range(version:vers, test_version:"4.0.0.rc1", test_version2:"4.0.0.rc7")){
    security_message(port:port);
  }
}
