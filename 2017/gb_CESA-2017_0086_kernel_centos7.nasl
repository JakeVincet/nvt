###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2017:0086 centos7 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882638");
  script_version("$Revision: 6659 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:52:22 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-01-20 05:39:39 +0100 (Fri, 20 Jan 2017)");
  script_cve_id("CVE-2016-6828", "CVE-2016-7117", "CVE-2016-9555");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for kernel CESA-2017:0086 centos7 ");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel packages contain the Linux kernel, 
the core of any Linux operating system.

These updated kernel packages include several security issues and numerous
bug fixes, some of which you can see below. Space precludes documenting all
of these bug fixes in this advisory. To see the complete list of bug fixes,
users are directed to the related Knowledge Article:
'https://access.redhat.com/articles/2857831'.

Security Fix(es):

* A use-after-free vulnerability was found in the kernel's socket recvmmsg
subsystem. This may allow remote attackers to corrupt memory and may allow
execution of arbitrary code. This corruption takes place during the error
handling routines within __sys_recvmmsg() function. (CVE-2016-7117,
Important)

* A use-after-free vulnerability was found in tcp_xmit_retransmit_queue and
other tcp_* functions. This condition could allow an attacker to send an
incorrect selective acknowledgment to existing connections, possibly
resetting a connection. (CVE-2016-6828, Moderate)

* A flaw was found in the Linux kernel's implementation of the SCTP
protocol. A remote attacker could trigger an out-of-bounds read with an
offset of up to 64kB potentially causing the system to crash.
(CVE-2016-9555, Moderate)

Bug Fix(es):

* Previously, the performance of Internet Protocol over InfiniBand (IPoIB)
was suboptimal due to a conflict of IPoIB with the Generic Receive Offload
(GRO) infrastructure. With this update, the data cached by the IPoIB driver
has been moved from a control block into the IPoIB hard header, thus
avoiding the GRO problem and the corruption of IPoIB address information.
As a result, the performance of IPoIB has been improved. (BZ#1390668)

* Previously, when a virtual machine (VM) with PCI-Passthrough interfaces
was recreated, a race condition between the eventfd daemon and the virqfd
daemon occurred. Consequently, the operating system rebooted. This update
fixes the race condition. As a result, the operating system no longer
reboots in the described situation. (BZ#1391611)

* Previously, a packet loss occurred when the team driver in round-robin
mode was sending a large number of packets. This update fixes counting of
the packets in the round-robin runner of the team driver, and the packet
loss no longer occurs in the described situation. (BZ#1392023)

* Previously, the virtual network devices contained in the deleted
namespace could be deleted in any order. If the loopback device was not
deleted as the last item, other netns devices, such as vxlan devices, could
end up with dangling references to the loop ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "kernel on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:0086");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-January/022246.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-libs", rpm:"kernel-tools-libs~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-libs-devel", rpm:"kernel-tools-libs-devel~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~3.10.0~514.6.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
