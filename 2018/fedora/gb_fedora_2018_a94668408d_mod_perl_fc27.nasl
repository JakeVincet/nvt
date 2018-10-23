###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_a94668408d_mod_perl_fc27.nasl 11314 2018-09-11 08:30:14Z santu $
#
# Fedora Update for mod_perl FEDORA-2018-a94668408d
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
  script_oid("1.3.6.1.4.1.25623.1.0.875042");
  script_version("$Revision: 11314 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-11 10:30:14 +0200 (Tue, 11 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-08 07:28:37 +0200 (Sat, 08 Sep 2018)");
  script_cve_id("CVE-2011-2767");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mod_perl FEDORA-2018-a94668408d");
  script_tag(name:"summary", value:"Check the version of mod_perl");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"Mod_perl incorporates a Perl interpreter into
  the Apache web server, so that the Apache web server can directly execute Perl
  code. Mod_perl links the Perl run-time library into the Apache web server and
  provides an object-oriented Perl interface for Apache&#39 s C language API.
  The end result is a quicker CGI script turnaround process, since no external
  Perl interpreter has to be started.

Install mod_perl if you&#39 re installing the Apache web server and you&#39 d
like for it to directly incorporate a Perl interpreter.
");
  script_tag(name:"affected", value:"mod_perl on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-a94668408d");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KUOT2ZG2WTX6BQ32KFFUYIBYBIOY6RF7");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"mod_perl", rpm:"mod_perl~2.0.10~9.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
