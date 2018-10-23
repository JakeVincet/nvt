###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2128_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux USN-2128-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.841747");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-03-12 09:41:18 +0530 (Wed, 12 Mar 2014)");
  script_cve_id("CVE-2013-0160", "CVE-2013-2929", "CVE-2013-4587", "CVE-2013-6367",
                "CVE-2013-6380", "CVE-2013-6382", "CVE-2013-7027", "CVE-2013-7266",
                "CVE-2013-7267", "CVE-2013-7268", "CVE-2013-7269", "CVE-2013-7270",
                "CVE-2013-7271", "CVE-2014-1444", "CVE-2014-1445", "CVE-2014-1446",
                "CVE-2014-1874");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux USN-2128-1");


  script_tag(name:"affected", value:"linux on Ubuntu 10.04 LTS");
  script_tag(name:"insight", value:"An information leak was discovered in the Linux kernel when
inotify is used to monitor the /dev/ptmx device. A local user could exploit
this flaw to discover keystroke timing and potentially discover sensitive
information like password length. (CVE-2013-0160)

Vasily Kulikov reported a flaw in the Linux kernel's implementation of
ptrace. An unprivileged local user could exploit this flaw to obtain
sensitive information from kernel memory. (CVE-2013-2929)

Andrew Honig reported a flaw in the Linux Kernel's kvm_vm_ioctl_create_vcpu
function of the Kernel Virtual Machine (KVM) subsystem. A local user could
exploit this flaw to gain privileges on the host machine. (CVE-2013-4587)

Andrew Honig reported a flaw in the apic_get_tmcct function of the Kernel
Virtual Machine (KVM) subsystem if the Linux kernel. A guest OS user could
exploit this flaw to cause a denial of service or host OS system crash.
(CVE-2013-6367)

Nico Golde and Fabian Yamaguchi reported a flaw in the driver for Adaptec
AACRAID scsi raid devices in the Linux kernel. A local user could use this
flaw to cause a denial of service or possibly other unspecified impact.
(CVE-2013-6380)

Nico Golde and Fabian Yamaguchi reported buffer underflow errors in the
implementation of the XFS filesystem in the Linux kernel. A local user with
CAP_SYS_ADMIN could exploit these flaw to cause a denial of service (memory
corruption) or possibly other unspecified issues. (CVE-2013-6382)

Evan Huus reported a buffer overflow in the Linux kernel's radiotap header
parsing. A remote attacker could cause a denial of service (buffer over-
read) via a specially crafted header. (CVE-2013-7027)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
systemcalls when used with ISDN sockets in the Linux kernel. A local user
could exploit this leak to obtain potentially sensitive information from
kernel memory. (CVE-2013-7266)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
systemcalls when used with apple talk sockets in the Linux kernel. A local
user could exploit this leak to obtain potentially sensitive information
from kernel memory. (CVE-2013-7267)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
systemcalls when used with ipx protocol sockets in the Linux kernel. A
local user could exploit this leak to obtain potentially sensitive
information from kernel memory. (CVE-2013-7268)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
systemcalls when used with the netrom address family in the Linux kernel. A
local user could exploit this leak to obtain potentially s ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2128-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2128-1/");
  script_tag(name:"summary", value:"Check for the Version of linux");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU10\.04 LTS");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-386", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-generic", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-generic-pae", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-ia64", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-lpia", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-powerpc", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-powerpc-smp", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-powerpc64-smp", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-preempt", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-server", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-sparc64", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-sparc64-smp", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-versatile", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-57-virtual", ver:"2.6.32-57.119", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
