###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_tomcat_39635.nasl 4340 2016-10-25 06:08:37Z cfi $
#
# Apache Tomcat Authentication Header Realm Name Information Disclosure Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100598");
  script_version("$Revision: 4340 $");
  script_tag(name:"last_modification", value:"$Date: 2016-10-25 08:08:37 +0200 (Tue, 25 Oct 2016) $");
  script_tag(name:"creation_date", value:"2010-04-23 13:12:25 +0200 (Fri, 23 Apr 2010)");
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:N/A:N");
  script_bugtraq_id(39635);
  script_cve_id("CVE-2010-1157");
  script_name("Apache Tomcat Authentication Header Realm Name Information Disclosure Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web Servers");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_apache_tomcat_detect.nasl");
  script_require_ports("Services/www", 8080);
  script_mandatory_keys("ApacheTomcat/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/39635");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-5.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/");
  script_xref(name:"URL", value:"http://svn.apache.org/viewvc?view=revision&revision=936540");
  script_xref(name:"URL", value:"http://svn.apache.org/viewvc?view=revision&revision=936541");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/510879");

  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");

  script_tag(name:"summary", value:"Apache Tomcat is prone to a remote information-disclosure
  vulnerability.");

  script_tag(name:"impact", value:"Remote attackers can exploit this issue to obtain the host name or IP
  address of the Tomcat server. Information harvested may lead to further attacks.");

  script_tag(name:"affected", value:"Tomcat 5.5.0 through 5.5.29 Tomcat 6.0.0 through 6.0.26

  Tomcat 3.x, 4.0.x, and 5.0.x may also be affected.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

    
include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"5.5.0", test_version2:"5.5.29" ) ||
    version_in_range( version:vers, test_version:"6.0.0", test_version2:"6.0.26" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.5.30/6.0.27" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
