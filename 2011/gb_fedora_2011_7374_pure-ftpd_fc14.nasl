###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for pure-ftpd FEDORA-2011-7374
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_affected = "pure-ftpd on Fedora 14";
tag_insight = "Pure-FTPd is a fast, production-quality, standard-comformant FTP server,
  based upon Troll-FTPd. Unlike other popular FTP servers, it has no known
  security flaw, it is really trivial to set up and it is especially designed
  for modern Linux and FreeBSD kernels (setfsuid, sendfile, capabilities) .
  Features include PAM support, IPv6, chroot()ed home directories, virtual
  domains, built-in LS, anti-warez system, bandwidth throttling, FXP, bounded
  ports for passive downloads, UL/DL ratios, native LDAP and SQL support,
  Apache log files and more.
  Rebuild switches:
  --without ldap     disable ldap support
  --without mysql    disable mysql support
  --without pgsql    disable postgresql support
  --without extauth  disable external authentication
  --without tls      disable SSL/TLS";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-June/061742.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863301");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-06-24 16:46:35 +0200 (Fri, 24 Jun 2011)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_xref(name: "FEDORA", value: "2011-7374");
  script_cve_id("CVE-2011-0418");
  script_name("Fedora Update for pure-ftpd FEDORA-2011-7374");

  script_tag(name:"summary", value:"Check for the Version of pure-ftpd");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC14")
{

  if ((res = isrpmvuln(pkg:"pure-ftpd", rpm:"pure-ftpd~1.0.32~1.fc14", rls:"FC14")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}