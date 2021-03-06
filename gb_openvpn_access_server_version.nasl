###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openvpn_access_server_version.nasl 11885 2018-10-12 13:47:20Z cfischer $
#
# OpenVPN Access Server Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105344");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11885 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:47:20 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-09-04 10:33:25 +0200 (Fri, 04 Sep 2015)");
  script_name("OpenVPN Access Server Appliance Detection");

  script_tag(name:"summary", value:"This script performs SSH based detection of OpenVPN Access Server");

  script_tag(name:"qod_type", value:"package");

  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("login/SSH/success");
  exit(0);
}


include("ssh_func.inc");
include("host_details.inc");

soc = ssh_login_or_reuse_connection();
if( ! soc ) exit( 0 );

buf = ssh_cmd( socket:soc, cmd:"cat /etc/issue" );
if( "OpenVPN Access Server" >< buf )
{
  version = eregmatch( pattern:'OpenVPN Access Server Appliance ([0-9.]+) ', string: buf );
  if( ! isnull( version[1] ) ) vers = version[1];
  oas_installed = TRUE;
}

if( ! oas_installed || ! vers )
{
  buf = ssh_cmd( socket:soc, cmd:"cat /usr/local/openvpn_as/etc/VERSION" );
  if( "AS_VERSION=" >< buf )
  {
    version = eregmatch( pattern:"AS_VERSION=([0-9.]+)", string:buf );
    if( ! isnull( version[1] ) ) vers = version[1];
    oas_installed = TRUE;
  }
}

close( soc );

if( oas_installed )
{
  set_kb_item( name:"openvpn_as/installed", value:TRUE );

  cpe = 'cpe:/a:openvpn:openvpn_access_server';
  if( vers )
    cpe += ':' + vers;
  else
    vers = 'unknown';

  register_product( cpe:cpe, location:'ssh' );
  log_message(data: build_detection_report( app:"OpenVPN Access Server",
                                            version: vers,
                                            install:'ssh',
                                            cpe:cpe,
                                            concluded: buf ) );
  exit( 0 );
}

exit( 0 );
