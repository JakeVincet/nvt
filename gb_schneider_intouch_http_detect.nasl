###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_schneider_intouch_http_detect.nasl 10896 2018-08-10 13:24:05Z cfischer $
#
# Schneider Electric InTouch Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.141012");
  script_version("$Revision: 10896 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 15:24:05 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-04-19 13:41:45 +0700 (Thu, 19 Apr 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Schneider Electric InTouch Detection");

  script_tag(name:"summary", value:"Detection of Schneider Electric InTouch.

The script sends a connection request to the server and attempts to detect  Schneider Electric InTouch and to
extract its version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80, 81, 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.wonderware.com/hmi-scada/intouch/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

res = http_get_cache(port: port, item: "/");

if ("ISSymbol1.ProductName" >< res && "InTouch Machine Edition" >< res) {
  version = "unknown";

  vers = eregmatch(pattern: 'ProductVersion = "([0-9.]+)', string: res);
  if (!isnull(vers[1]))
    version = vers[1];

  set_kb_item(name: "schneider_intouch/installed", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)",
                  base: "cpe:/a:schneider_electric:wonderware_intouch_machine_edition:");
  if (!cpe)
    cpe = "cpe:/a:schneider_electric:wonderware_intouch_machine_edition";

  register_product(cpe: cpe, location: "/", port: port, service: "www");

  log_message(data: build_detection_report(app: "Schneider Electric InTouch", version: version, install: "/",
                                           cpe: cpe, concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
