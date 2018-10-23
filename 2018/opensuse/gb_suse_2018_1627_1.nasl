###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_1627_1.nasl 12004 2018-10-22 05:34:04Z cfischer $
#
# SuSE Update for prosody openSUSE-SU-2018:1627-1 (prosody)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851783");
  script_version("$Revision: 12004 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-22 07:34:04 +0200 (Mon, 22 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-06-10 05:48:43 +0200 (Sun, 10 Jun 2018)");
  script_cve_id("CVE-2018-10847");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for prosody openSUSE-SU-2018:1627-1 (prosody)");
  script_tag(name:"summary", value:"Check the version of prosody");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"
  This update for prosody fixes the following issues:

  This security issue was fixed:

  - CVE-2018-10847: Prevent insufficient validation of client-provided
  parameters during XMPP stream restarts. Authenticated users may have
  overridden the realm associated with their session, potentially bypassing
  security policies and allowing impersonation (bsc#1094890).


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended 
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-597=1");
  script_tag(name:"affected", value:"prosody on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:1627_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-06/msg00017.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"prosody", rpm:"prosody~0.9.13~2.6.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"prosody-debuginfo", rpm:"prosody-debuginfo~0.9.13~2.6.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"prosody-debugsource", rpm:"prosody-debugsource~0.9.13~2.6.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
