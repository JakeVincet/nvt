###############################################################################
# OpenVAS Vulnerability Test
# $Id: sendcard_sql.nasl 7287 2017-09-27 06:56:51Z cfischer $
#
# Sendcard SQL injection
#
# Authors:
# Josh Zlatin-Amishav (josh at ramat dot cc)
#
# Copyright:
# Copyright (C) 2005 Josh Zlatin-Amishav
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.19748");
  script_version("$Revision: 7287 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-27 08:56:51 +0200 (Wed, 27 Sep 2017) $");
  script_tag(name:"creation_date", value:"2006-03-26 17:55:15 +0200 (Sun, 26 Mar 2006)");
  script_cve_id("CVE-2005-2404");
  script_bugtraq_id(14351);
  script_xref(name:"OSVDB", value:"18153");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Sendcard SQL injection");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("(C) 2005 Josh Zlatin-Amishav");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "The remote host is running Sendcard, a multi-database e-card program written
  in PHP.

  The version of Sendcard installed on the remote host is prone to a SQL
  injection attack due to its failure to sanitize user-supplied input to
  the 'id' field in the 'sendcard.php' script.";

  tag_solution = "Unknown at this time";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"remote_active");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string( dir, "/sendcard.php?view=1&id=%27", SCRIPT_NAME );

  req = http_get( item:url, port:port );
  res = http_keepalive_send_recv( port:port, data:req, bodyonly:TRUE );

  if( ( "SELECT \* FROM sendcard where id='" + SCRIPT_NAME ) >< res &&
        "MySQL Error" >< res ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
