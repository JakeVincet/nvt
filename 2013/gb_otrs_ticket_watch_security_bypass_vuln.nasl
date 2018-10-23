###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_otrs_ticket_watch_security_bypass_vuln.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# OTRS Ticket Watch Security Bypass Vulnerability
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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
CPE = "cpe:/a:otrs:otrs";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803943");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2013-4088");
  script_bugtraq_id(60688);
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:N/A:P");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-09-22 10:18:31 +0530 (Sun, 22 Sep 2013)");
  script_name("OTRS Ticket Watch Security Bypass Vulnerability");


  script_tag(name:"impact", value:"Successful exploitation will allow remote authenticated users to bypass
intended security restriction and obtain sensitive information.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"An error exists in application which fails properly verifying permissions
when accessing tickets via the ticket watch mechanism");
  script_tag(name:"solution", value:"Upgrade to OTRS (Open Ticket Request System) version 3.0.21 or 3.1.17 or
3.2.8 or later.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"This host is installed with OTRS (Open Ticket Request System) and is prone to
security bypass vulnerability.");
  script_tag(name:"affected", value:"OTRS (Open Ticket Request System) version 3.0.x up to and including 3.0.20,
3.1.x up to and including 3.1.16 and 3.2.x up to and including 3.2.7.");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/60688");
  script_xref(name:"URL", value:"http://secunia.com/advisories/53851/");
  script_xref(name:"URL", value:"http://www.otrs.com/en/open-source/community-news/security-advisories/Security-Advisory-2013-04/");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("secpod_otrs_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("OTRS/installed");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");


if(!port = get_app_port(cpe:CPE)){
  exit(0);
}

if(vers = get_app_version(cpe:CPE, port:port))
{
  if(version_in_range(version:vers, test_version:"3.2.0", test_version2:"3.2.7") ||
     version_in_range(version:vers, test_version:"3.0.0", test_version2:"3.0.20") ||
     version_in_range(version:vers, test_version:"3.1.0", test_version2:"3.1.16"))
  {
      security_message(port:port);
      exit(0);
  }

}