###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2012_0091_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# SuSE Update for libqt4 openSUSE-SU-2012:0091-1 (libqt4)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_affected = "libqt4 on openSUSE 11.4, openSUSE 11.3";
tag_insight = "A stack-based buffer overflow in the glyph handling of
  libqt4's harfbuzz has been fixed. CVE-2011-3922 has been
  assigned to this issue.";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850178");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-08-02 20:16:33 +0530 (Thu, 02 Aug 2012)");
  script_cve_id("CVE-2011-3922");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "openSUSE-SU", value: "2012:0091_1");
  script_name("SuSE Update for libqt4 openSUSE-SU-2012:0091-1 (libqt4)");

  script_tag(name: "summary" , value: "Check for the Version of libqt4");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
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

if(release == "openSUSE11.4")
{

  if ((res = isrpmvuln(pkg:"libQtWebKit-devel", rpm:"libQtWebKit-devel~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libQtWebKit4", rpm:"libQtWebKit4~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4", rpm:"libqt4~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-devel", rpm:"libqt4-devel~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-qt3support", rpm:"libqt4-qt3support~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-sql", rpm:"libqt4-sql~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-sql-sqlite", rpm:"libqt4-sql-sqlite~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-x11", rpm:"libqt4-x11~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libQtWebKit4-32bit", rpm:"libQtWebKit4-32bit~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-32bit", rpm:"libqt4-32bit~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-qt3support-32bit", rpm:"libqt4-qt3support-32bit~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-sql-32bit", rpm:"libqt4-sql-32bit~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-sql-sqlite-32bit", rpm:"libqt4-sql-sqlite-32bit~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-x11-32bit", rpm:"libqt4-x11-32bit~4.7.1~8.17.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "openSUSE11.3")
{

  if ((res = isrpmvuln(pkg:"libQtWebKit-devel", rpm:"libQtWebKit-devel~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libQtWebKit4", rpm:"libQtWebKit4~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4", rpm:"libqt4~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-devel", rpm:"libqt4-devel~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-qt3support", rpm:"libqt4-qt3support~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-sql", rpm:"libqt4-sql~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-sql-sqlite", rpm:"libqt4-sql-sqlite~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-x11", rpm:"libqt4-x11~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libQtWebKit4-32bit", rpm:"libQtWebKit4-32bit~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-32bit", rpm:"libqt4-32bit~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-qt3support-32bit", rpm:"libqt4-qt3support-32bit~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-sql-32bit", rpm:"libqt4-sql-32bit~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-sql-sqlite-32bit", rpm:"libqt4-sql-sqlite-32bit~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libqt4-x11-32bit", rpm:"libqt4-x11-32bit~4.6.3~2.7.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
