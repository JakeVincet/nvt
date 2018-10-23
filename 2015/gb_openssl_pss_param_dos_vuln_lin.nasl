###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_pss_param_dos_vuln_lin.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# OpenSSL 'PSS' parameter Denial of Service Vulnerability (Linux)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806652");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-3194");
  script_bugtraq_id(78623);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-12-18 08:50:22 +0530 (Fri, 18 Dec 2015)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL 'PSS' parameter Denial of Service Vulnerability (Linux)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to a denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to error within
  crypto/rsa/rsa_ameth.c script as the signature verification routines crash
  with a NULL pointer dereference if presented with an ASN.1 signature using
  the RSA PSS algorithm and absent mask generation function parameter.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to cause a denial of service condition.");

  script_tag(name:"affected", value:"OpenSSL versions 1.0.1 before 1.0.1q and
  1.0.2 before 1.0.2e on Linux");

  script_tag(name:"solution", value:"Upgrade to OpenSSL 1.0.1q or 1.0.2e or
  later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://openssl.org/news/secadv/20151203.txt");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  script_xref(name:"URL", value:"https://www.openssl.org");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!sslVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(sslVer =~ "^(1\.0\.1)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.1q"))
  {
    fix = "1.0.1q";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.2)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.2e"))
  {
    fix = "1.0.2e";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = 'Installed version: ' + sslVer + '\n' +
           'Fixed version:     ' + fix + '\n';

  security_message(data:report);
  exit(0);
}
