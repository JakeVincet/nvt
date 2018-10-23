###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2016-685.nasl 6574 2017-07-06 13:41:26Z cfischer$
#
# Amazon Linux security check
#
# Authors:
# Eero Volotinen <eero.volotinen@iki.fi>
#
#
# Copyright:
# Copyright (c) 2016 Eero Volotinen, http://ping-viini.org
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.120675");
  script_version("$Revision: 11856 $");
  script_tag(name:"creation_date", value:"2016-05-09 14:11:51 +0300 (Mon, 09 May 2016)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 09:45:29 +0200 (Fri, 12 Oct 2018) $");
  script_name("Amazon Linux Local Check: alas-2016-685");
  script_tag(name:"insight", value:"A stack overflow vulnerability was reported that may occur when decompressing tar archives due to phar_tar_writeheaders() potentially copying non-terminated linknames from entries parsed by phar_parse_tarfile().");
  script_tag(name:"solution", value:"Run yum update php56 to update your system.
                                    Run yum update php55 to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2016-685.html");
  script_cve_id("CVE-2016-2554");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
  script_copyright("Eero Volotinen");
  script_family("Amazon Linux Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"php55", rpm:"php55~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-dbg", rpm:"php56-dbg~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-mssql", rpm:"php55-mssql~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-mbstring", rpm:"php55-mbstring~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-soap", rpm:"php56-soap~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-debuginfo", rpm:"php55-debuginfo~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-cli", rpm:"php56-cli~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-opcache", rpm:"php55-opcache~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-process", rpm:"php56-process~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-common", rpm:"php55-common~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-enchant", rpm:"php56-enchant~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-dba", rpm:"php55-dba~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-xml", rpm:"php56-xml~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-ldap", rpm:"php55-ldap~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-debuginfo", rpm:"php56-debuginfo~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-process", rpm:"php55-process~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-mysqlnd", rpm:"php56-mysqlnd~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-soap", rpm:"php55-soap~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-opcache", rpm:"php56-opcache~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-intl", rpm:"php55-intl~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-snmp", rpm:"php56-snmp~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-enchant", rpm:"php55-enchant~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56", rpm:"php56~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-gd", rpm:"php55-gd~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-dba", rpm:"php56-dba~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-imap", rpm:"php55-imap~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-common", rpm:"php56-common~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-gmp", rpm:"php55-gmp~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-pgsql", rpm:"php56-pgsql~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-tidy", rpm:"php55-tidy~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-embedded", rpm:"php56-embedded~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-snmp", rpm:"php55-snmp~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-pdo", rpm:"php56-pdo~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-cli", rpm:"php55-cli~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-intl", rpm:"php56-intl~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-pspell", rpm:"php55-pspell~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-mbstring", rpm:"php56-mbstring~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-pdo", rpm:"php55-pdo~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-imap", rpm:"php56-imap~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-mcrypt", rpm:"php55-mcrypt~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-pspell", rpm:"php56-pspell~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-recode", rpm:"php55-recode~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-recode", rpm:"php56-recode~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-xmlrpc", rpm:"php55-xmlrpc~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-mssql", rpm:"php56-mssql~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-fpm", rpm:"php55-fpm~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-gd", rpm:"php56-gd~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-odbc", rpm:"php55-odbc~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-fpm", rpm:"php56-fpm~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-embedded", rpm:"php55-embedded~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-odbc", rpm:"php56-odbc~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-xml", rpm:"php55-xml~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-bcmath", rpm:"php56-bcmath~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-mysqlnd", rpm:"php55-mysqlnd~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-xmlrpc", rpm:"php56-xmlrpc~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-bcmath", rpm:"php55-bcmath~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-mcrypt", rpm:"php56-mcrypt~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-devel", rpm:"php55-devel~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-devel", rpm:"php56-devel~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php55-pgsql", rpm:"php55-pgsql~5.5.33~1.113.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-gmp", rpm:"php56-gmp~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-tidy", rpm:"php56-tidy~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-ldap", rpm:"php56-ldap~5.6.19~1.123.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
