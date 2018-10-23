###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_sol43552605.nasl 5759 2017-03-29 09:01:08Z teissa $
#
# F5 BIG-IP - SOL43552605 - Out-of-bounds memory vulnerability with the BIG-IP APM system CVE-2015-8098
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/h:f5:big-ip";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105505");
 script_cve_id("CVE-2015-8098");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_version ("$Revision: 5759 $");

 script_name("F5 BIG-IP - SOL43552605 - Out-of-bounds memory vulnerability with the BIG-IP APM system CVE-2015-8098");

 script_xref(name:"URL", value:"https://support.f5.com/kb/en-us/solutions/public/k/43/sol43552605.html");

 script_tag(name: "impact" , value:"An unauthenticated remote attacker may be able to cause a denial-of-service (DoS) or perform remote code execution on an affected BIG-IP APM device.");

 script_tag(name: "vuldetect" , value:"Check the version.");

 script_tag(name: "insight" , value:"An out-of-bounds memory vulnerability may allow an unauthenticated BIG-IP APM user to cause a denial-of-service (DoS) or possibly perform remote code execution on a BIG-IP system processing a Citrix Remote Desktop connection through a virtual server that is configured with remote desktop profile");

 script_tag(name: "solution" , value:"See the referenced vendor advisory for a solution.");
 script_tag(name: "summary" , value:"The remote host is missing a security patch.");

 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2017-03-29 11:01:08 +0200 (Wed, 29 Mar 2017) $");
 script_tag(name:"creation_date", value:"2016-01-08 11:49:44 +0100 (Fri, 08 Jan 2016)");
 script_category(ACT_GATHER_INFO);
 script_family("F5 Local Security Checks");
 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_dependencies("gb_f5_big_ip_version.nasl");
 script_require_ports("Services/ssh", 22);
 script_mandatory_keys("f5/big_ip/version","f5/big_ip/active_modules");
 exit(0);
}

include("version_func.inc");
include("host_details.inc");
include("misc_func.inc");
include("f5.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

check_f5['APM'] = make_array( 'affected',   '11.6.0-11.6.0_HF3;11.5.0-11.5.2_HF1;11.4.1-11.4.1_HF8;',
                              'unaffected', '12.0.0;11.6.0_HF4-11.6.0_HF6;11.5.3;11.4.1_HF9;11.0.0-11.4.0;10.1.0-10.2.4;');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

