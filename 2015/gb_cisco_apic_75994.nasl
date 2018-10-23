###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_apic_75994.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Cisco Application Policy Infrastructure Controller Access Control Vulnerability
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

CPE = "cpe:/o:cisco:application_policy_infrastructure_controller_(apic)";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105535");
  script_bugtraq_id(75994);
  script_cve_id("CVE-2015-4235");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_version("$Revision: 11872 $");

  script_name("Cisco Application Policy Infrastructure Controller Access Control Vulnerability ");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20150722-apic");

  script_tag(name:"impact", value:"An exploit could allow the attacker to gain access to the APIC as the root user and perform root-level commands.");
  script_tag(name:"vuldetect", value:"Check the version");
  script_tag(name:"insight", value:"The vulnerability is due to improper implementation of access controls in the APIC filesystem. An attacker could exploit this vulnerability by accessing the cluster management configuration of the APIC.");
  script_tag(name:"solution", value:"Updates are available");
  script_tag(name:"summary", value:"A vulnerability in the cluster management configuration of the Cisco Application Policy Infrastructure Controller (APIC) could allow an authenticated, remote attacker to access the APIC as the root user.");
  script_tag(name:"affected", value:"Application Policy Infrastructure Controllers running software versions prior to 1.1(1j), 1.0(3o) and 1.0(4o).");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-02-10 12:54:47 +0100 (Wed, 10 Feb 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_apic_web_detect.nasl");
  script_require_ports("Services/www", 80, 443);
  script_mandatory_keys("cisco/application_policy_infrastructure_controller/installed");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers =  get_app_version( cpe:CPE, port:port ) ) exit( 0 );

vulnerable_versions = make_list( "1.0(1e)",
                                 "1.0(1h)",
                                 "1.0(1k)",
                                 "1.0(1n)",
                                 "1.0(2j)",
                                 "1.0(2m)",
                                 "1.0(2n)",
                                 "1.0(3f)",
                                 "1.0(3i)",
                                 "1.0(3k)",
                                 "1.0(3n)",
                                 "1.0(4h)",
                                 "1.1(1i)",
                                 "1.1(1h)",
                                 "1.1(1g)",
                                 "1.1(1f)",
                                 "1.1(1e)");

foreach v ( vulnerable_versions )
{
  if( vers == v )
  {
      report = report_fixed_ver( installed_version:vers, fixed_version:'See vendor advisory' );
      security_message( port:port, data:report );
      exit (0 );
  }
}

exit( 99 );
