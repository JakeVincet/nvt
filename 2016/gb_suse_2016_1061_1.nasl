###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_1061_1.nasl 8047 2017-12-08 08:56:07Z santu $
#
# SuSE Update for Chromium openSUSE-SU-2016:1061-1 (Chromium)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.851280");
  script_version("$Revision: 8047 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:56:07 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-04-18 05:21:55 +0200 (Mon, 18 Apr 2016)");
  script_cve_id("CVE-2016-1651", "CVE-2016-1652", "CVE-2016-1653", "CVE-2016-1654", 
                "CVE-2016-1655", "CVE-2016-1656", "CVE-2016-1657", "CVE-2016-1658", 
                "CVE-2016-1659");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Chromium openSUSE-SU-2016:1061-1 (Chromium)");
  script_tag(name: "summary", value: "Check the version of Chromium");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  Chromium was updated to 50.0.2661.75 to fix the following vulnerabilities:

  - CVE-2016-1651: Out-of-bounds read in Pdfium JPEG2000 decoding
  - CVE-2016-1652: Universal XSS in extension bindings
  - CVE-2016-1653: Out-of-bounds write in V8
  - CVE-2016-1654: Uninitialized memory read in media
  - CVE-2016-1655: Use-after-free related to extensions
  - CVE-2016-1656: Android downloaded file path restriction bypass
  - CVE-2016-1657: Address bar spoofing
  - CVE-2016-1658: Potential leak of sensitive information to malicious
  extensions
  - CVE-2016-1659: Various fixes from internal audits, fuzzing and other
  initiatives");
  script_tag(name: "affected", value: "Chromium on openSUSE Leap 42.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2016:1061_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSELeap42.1")
{

  if ((res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~50.0.2661.75~41.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromedriver-debuginfo", rpm:"chromedriver-debuginfo~50.0.2661.75~41.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~50.0.2661.75~41.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~50.0.2661.75~41.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debugsource", rpm:"chromium-debugsource~50.0.2661.75~41.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-gnome", rpm:"chromium-desktop-gnome~50.0.2661.75~41.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-kde", rpm:"chromium-desktop-kde~50.0.2661.75~41.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo", rpm:"chromium-ffmpegsumo~50.0.2661.75~41.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo-debuginfo", rpm:"chromium-ffmpegsumo-debuginfo~50.0.2661.75~41.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
