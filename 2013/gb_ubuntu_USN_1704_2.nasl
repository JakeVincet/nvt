###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1704_2.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-lts-quantal USN-1704-2
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



if(description)
{
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1704-2/");
  script_oid("1.3.6.1.4.1.25623.1.0.841304");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-02-04 09:57:45 +0530 (Mon, 04 Feb 2013)");
  script_cve_id("CVE-2012-0957", "CVE-2012-4461", "CVE-2012-4508", "CVE-2012-4530",
                "CVE-2012-4565", "CVE-2012-5517", "CVE-2012-5532");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:N/A:N");
  script_xref(name:"USN", value:"1704-2");
  script_name("Ubuntu Update for linux-lts-quantal USN-1704-2");

  script_tag(name:"summary", value:"Check for the Version of linux-lts-quantal");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
  script_tag(name:"affected", value:"linux-lts-quantal on Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"USN-1704-1 fixed vulnerabilities in the Linux kernel. Due to an unrelated
  regression inotify/fanotify stopped working after upgrading. This update
  fixes the problem.

  We apologize for the inconvenience.

  Original advisory details:

  Brad Spengler discovered a flaw in the Linux kernel's uname system call. An
  unprivileged user could exploit this flaw to read kernel stack memory.
  (CVE-2012-0957)

  Jon Howell reported a flaw in the Linux kernel's KVM (Kernel-based virtual
  machine) subsystem's handling of the XSAVE feature. On hosts, using qemu
  userspace, without the XSAVE feature an unprivileged local attacker could
  exploit this flaw to crash the system. (CVE-2012-4461)

  Dmitry Monakhov reported a race condition flaw the Linux ext4 filesystem
  that can expose stale data. An unprivileged user could exploit this flaw to
  cause an information leak. (CVE-2012-4508)

  A flaw was discovered in the Linux kernel's handling of script execution
  when module loading is enabled. A local attacker could exploit this flaw to
  cause a leak of kernel stack contents. (CVE-2012-4530)

  Rodrigo Freire discovered a flaw in the Linux kernel's TCP illinois
  congestion control algorithm. A local attacker could use this to cause a
  denial of service. (CVE-2012-4565)

  A flaw was discovered in the Linux kernel's handling of new hot-plugged
  memory. An unprivileged local user could exploit this flaw to cause a
  denial of service by crashing the system. (CVE-2012-5517)

  Florian Weimer discovered that hypervkvpd, which is distributed in the
  Linux kernel, was not correctly validating source addresses of netlink
  packets. An untrusted local user can cause a denial of service by causing
  hypervkvpd to exit. (CVE-2012-5532)");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.5.0-23-generic", ver:"3.5.0-23.35~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
