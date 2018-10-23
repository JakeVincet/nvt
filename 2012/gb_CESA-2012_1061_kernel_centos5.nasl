###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2012:1061 centos5 
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
tag_insight = "The kernel packages contain the Linux kernel, the core of any Linux
  operating system.

  Security fix:
  
  * The fix for CVE-2011-1083 (RHSA-2012:0150) introduced a flaw in the way
  the Linux kernel's Event Poll (epoll) subsystem handled resource clean up
  when an ELOOP error code was returned. A local, unprivileged user could use
  this flaw to cause a denial of service. (CVE-2012-3375, Moderate)
  
  Bug fixes:
  
  * The qla2xxx driver handled interrupts for QLogic Fibre Channel adapters
  incorrectly due to a bug in a test condition for MSI-X support. This update
  corrects the bug and qla2xxx now handles interrupts as expected.
  (BZ#816373)
  
  * A process scheduler did not handle RPC priority wait queues correctly.
  Consequently, the process scheduler failed to wake up all scheduled tasks
  as expected after RPC timeout, which caused the system to become
  unresponsive and could significantly decrease system performance. This
  update modifies the process scheduler to handle RPC priority wait queues as
  expected. All scheduled tasks are now properly woken up after RPC timeout
  and the system behaves as expected. (BZ#817571)
  
  * The kernel version 2.6.18-308.4.1.el5 contained several bugs which led to
  an overrun of the NFS server page array. Consequently, any attempt to
  connect an NFS client running on Red Hat Enterprise Linux 5.8 to the NFS
  server running on the system with this kernel caused the NFS server to
  terminate unexpectedly and the kernel to panic. This update corrects the
  bugs causing NFS page array overruns and the kernel no longer crashes in
  this scenario. (BZ#820358)
  
  * An insufficiently designed calculation in the CPU accelerator in the
  previous kernel caused an arithmetic overflow in the sched_clock() function
  when system uptime exceeded 208.5 days. This overflow led to a kernel panic
  on the systems using the Time Stamp Counter (TSC) or Virtual Machine
  Interface (VMI) clock source. This update corrects the calculation so that
  this arithmetic overflow and kernel panic can no longer occur under these
  circumstances.
  
  Note: This advisory does not include a fix for this bug for the 32-bit
  architecture. (BZ#824654)
  
  * Under memory pressure, memory pages that are still a part of a
  checkpointing transaction can be invalidated. However, when the pages were
  invalidated, the journal head was re-filed onto the transactions' &quot;forget&quot;
  list, which caused the current running transaction's block to be modified.
  As a result, block accounting was not properly performed on that modified
  block because it appeared to have al ... 

  Description truncated, for more information please check the Reference URL";

tag_affected = "kernel on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-July/018707.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881076");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:01:30 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-3375", "CVE-2011-1083");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
  script_xref(name: "CESA", value: "2012:1061");
  script_name("CentOS Update for kernel CESA-2012:1061 centos5 ");

  script_tag(name: "summary" , value: "Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE", rpm:"kernel-PAE~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE-devel", rpm:"kernel-PAE-devel~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~308.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
