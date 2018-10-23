###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_libsoup_rce_vuln.nasl 11982 2018-10-19 08:49:21Z mmartin $
#
# libsoup Remote Code Execution Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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

CPE = 'cpe:/a:gnome:libsoup';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140320");
  script_version("$Revision: 11982 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 10:49:21 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-08-22 11:08:37 +0700 (Tue, 22 Aug 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2017-2885");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("libsoup Remote Code Execution Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_libsoup_detect.nasl");
  script_mandatory_keys("libsoup/detected");

  script_tag(name:"summary", value:"An exploitable stack based buffer overflow vulnerability exists in the GNOME
libsoup. A specially crafted HTTP request can cause a stack overflow resulting in remote code execution. An
attacker can send a special HTTP request to the vulnerable server to trigger this vulnerability.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"affected", value:"libsoup version 2.59.90 and prior.");

  script_tag(name:"solution", value:"Update to version 2.59.90.1 or later");

  script_xref(name:"URL", value:"https://www.talosintelligence.com/vulnerability_reports/TALOS-2017-0392");
  script_xref(name:"URL", value:"http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.59/libsoup-2.59.90.1.news");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "2.59.90")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.59.90.1");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
