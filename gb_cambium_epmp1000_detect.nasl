###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cambium_epmp1000_detect.nasl 10922 2018-08-10 19:21:48Z cfischer $
#
# Cambium Networks ePMP 1000 Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106627");
  script_version("$Revision: 10922 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 21:21:48 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-03-03 10:33:24 +0700 (Fri, 03 Mar 2017)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Cambium Networks ePMP 1000 Detection");

  script_tag(name:"summary", value:"Detection of Cambium Networks ePMP 1000

The script sends a HTTP connection request to the server and attempts to detect the presence of Cambium Networks
ePMP 1000 and to extract its version.");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.cambiumnetworks.com/products/access/epmp-1000/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

res = http_get_cache(port: port, item: "/");

if (res =~ "<title>ePMP( 1000)?</title>" && 'data-inactive="No Internet Connectivity"' >< res &&
    "cambium.min.css" >< res) {
  version = "unknown";

  vers = eregmatch(pattern: 'sw_version">([0-9.]+)', string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    set_kb_item(name: "epmp1000/version", value: version);
  }

  set_kb_item(name: "epmp1000/detected", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:cambium_networks:epmp1000:");
  if (!cpe)
    cpe = 'cpe:/a:cambium_networks:epmp1000';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "Cambium Networks ePMP 1000", version: version, install: "/",
                                           cpe: cpe, concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
