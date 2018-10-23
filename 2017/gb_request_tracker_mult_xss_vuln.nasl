###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_request_tracker_mult_xss_vuln.nasl 11982 2018-10-19 08:49:21Z mmartin $
#
# Request Tracker Multiple Cross Site Scripting Vulnerabilities
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

CPE = "cpe:/a:best_practical_solutions:request_tracker";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811528");
  script_version("$Revision: 11982 $");
  script_cve_id("CVE-2015-5475", "CVE-2015-6506");
  script_bugtraq_id(76364);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 10:49:21 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-18 16:33:24 +0530 (Tue, 18 Jul 2017)");
  script_name("Request Tracker Multiple Cross Site Scripting Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with Request Tracker
  and is prone to multiple cross site scripting vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - An insufficient validation of public key parameter in the cryptography
    interface.

  - An insufficient sanitization of vectors related to the (1) user and (2)
    group rights management pages.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary script code in the browser of an unsuspecting user
  in the context of the affected site. This may let the attacker steal cookie-based
  authentication credentials and launch other attacks.");

  script_tag(name:"affected", value:"Request Tracker 4.x before 4.2.12.");

  script_tag(name:"solution", value:"Upgrade to Request Tracker version 4.2.12,
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name:"URL", value:"https://docs.bestpractical.com/release-notes/rt/4.2.12");
  script_xref(name:"URL", value:"https://bestpractical.com/blog/2015/08/security-vulnerabilities-in-rt");

  script_category(ACT_GATHER_INFO);
  script_family("Web Servers");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("rt_detect.nasl");
  script_mandatory_keys("RequestTracker/installed");
  script_require_ports("Services/www", 80);
  script_xref(name:"URL", value:"https://forum.bestpractical.com");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!rtPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!rtVer = get_app_version(cpe:CPE, port:rtPort)){
  exit(0);
}

if(rtVer =~ "(^4\.)")
{
  if(version_is_less(version:rtVer, test_version:"4.2.12"))
  {
    report = report_fixed_ver(installed_version:rtVer, fixed_version:"4.2.12");
    security_message(port:rtPort, data:report);
    exit(0);
  }
}
exit(0);
