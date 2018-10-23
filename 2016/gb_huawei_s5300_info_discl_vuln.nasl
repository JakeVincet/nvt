###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_huawei_s5300_info_discl_vuln.nasl 11725 2018-10-02 10:50:50Z asteins $
#
# Huawei S5300 Campus Series Switches information Disclosure Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.106157");
  script_version("$Revision: 11725 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-02 12:50:50 +0200 (Tue, 02 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-07-29 09:30:37 +0700 (Fri, 29 Jul 2016)");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_cve_id("CVE-2015-8675");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Huawei S5300 Campus Series Switches information Disclosure Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_huawei_switch_detect.nasl");
  script_mandatory_keys("huawei_switch/detected", "huawei_switch/model", "huawei_switch/version");

  script_tag(name:"summary", value:"Huawei S5300 Campus Series switches are prone to a local information
disclosure vulnerability.");


  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"When uploading files to some directory, the user needs to enter the
username and password. However, the system does not mask passwords. As a result, the password entered is
displayed in plain text, leading to password leaks.");

  script_tag(name:"impact", value:"Physically proximate attackers may obtain sensitive password information
by reading the display.");

  script_tag(name:"affected", value:"Versions prior to V200R005SPH008");

  script_tag(name:"solution", value:"Upgrade to Version V200R005SPH008 or later");

  script_xref(name:"URL", value:"http://www.huawei.com/en/psirt/security-advisories/huawei-sa-20160112-01-switch-en");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");
include("revisions-lib.inc");

model = get_kb_item("huawei_switch/model");
if (model !~ "^S53")
  exit(0);

if (!version = get_kb_item("huawei_switch/version"))
  exit(0);

if (revcomp(a: version, b: "v200r005sph008") < 0) {
  report = report_fixed_ver(installed_version: toupper(version), fixed_version: "V200R005SPH008");
  security_message(port: 0, data: report);
  exit(0);
}

exit(0);