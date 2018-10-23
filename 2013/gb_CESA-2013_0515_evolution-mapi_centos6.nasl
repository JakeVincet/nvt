###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for evolution-mapi CESA-2013:0515 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "The openchange packages provide libraries to access Microsoft Exchange
  servers using native protocols. Evolution-MAPI uses these libraries to
  integrate the Evolution PIM application with Microsoft Exchange servers.

  A flaw was found in the Samba suite's Perl-based DCE/RPC IDL (PIDL)
  compiler. As OpenChange uses code generated by PIDL, this could have
  resulted in buffer overflows in the way OpenChange handles RPC calls. With
  this update, the code has been generated with an updated version of PIDL to
  correct this issue. (CVE-2012-1182)
  
  The openchange packages have been upgraded to upstream version 1.0, which
  provides a number of bug fixes and enhancements over the previous version,
  including support for the rebased samba4 packages and several API changes.
  (BZ#767672, BZ#767678)
  
  This update also fixes the following bugs:
  
  * When the user tried to modify a meeting with one required attendee and
  himself as the organizer, a segmentation fault occurred in the memcpy()
  function. Consequently, the evolution-data-server application terminated
  unexpectedly with a segmentation fault. This bug has been fixed and
  evolution-data-server no longer crashes in the described scenario.
  (BZ#680061)
  
  * Prior to this update, OpenChange 1.0 was unable to send messages with
  a large message body or with extensive attachment. This was caused by minor
  issues in OpenChange's exchange.idl definitions. This bug has been fixed
  and OpenChange now sends extensive messages without complications.
  (BZ#870405)
  
  All users of openchange are advised to upgrade to these updated packages,
  which fix these issues and add these enhancements.";


tag_affected = "evolution-mapi on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-March/019320.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881654");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-03-12 10:00:29 +0530 (Tue, 12 Mar 2013)");
  script_cve_id("CVE-2012-1182");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2013:0515");
  script_name("CentOS Update for evolution-mapi CESA-2013:0515 centos6 ");

  script_tag(name: "summary" , value: "Check for the Version of evolution-mapi");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"evolution-mapi", rpm:"evolution-mapi~0.28.3~12.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"evolution-mapi-devel", rpm:"evolution-mapi-devel~0.28.3~12.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
