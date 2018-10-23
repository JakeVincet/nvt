###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for rgmanager CESA-2011:1000 centos5 i386
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
tag_insight = "The rgmanager package contains the Red Hat Resource Group Manager, which
  provides the ability to create and manage high-availability server
  applications in the event of system downtime.

  It was discovered that certain resource agent scripts set the
  LD_LIBRARY_PATH environment variable to an insecure value containing empty
  path elements. A local user able to trick a user running those scripts to
  run them while working from an attacker-writable directory could use this
  flaw to escalate their privileges via a specially-crafted dynamic library.
  (CVE-2010-3389)
  
  Red Hat would like to thank Raphael Geissert for reporting this issue.
  
  This update also fixes the following bugs:
  
  * The failover domain &quot;nofailback&quot; option was not honored if a service was
  in the &quot;starting&quot; state. This bug has been fixed. (BZ#669440)
  
  * PID files with white spaces in the file name are now handled correctly.
  (BZ#632704)
  
  * The /usr/sbin/rhev-check.sh script can now be used from within Cron.
  (BZ#634225)
  
  * The clustat utility now reports the correct version. (BZ#654160)
  
  * The oracledb.sh agent now attempts to try the &quot;shutdown immediate&quot;
  command instead of using the &quot;shutdown abort&quot; command. (BZ#633992)
  
  * The SAPInstance and SAPDatabase scripts now use proper directory name
  quoting so they no longer collide with directory names like &quot;/u&quot;.
  (BZ#637154)
  
  * The clufindhostname utility now returns the correct value in all cases.
  (BZ#592613)
  
  * The nfsclient resource agent now handles paths with trailing slashes
  correctly. (BZ#592624)
  
  * The last owner of a service is now reported correctly after a failover.
  (BZ#610483)
  
  * The /usr/share/cluster/fs.sh script no longer runs the &quot;quotaoff&quot; command
  if quotas were not configured. (BZ#637678)
  
  * The &quot;listen&quot; line in the /etc/httpd/conf/httpd.conf file generated by the
  Apache resource agent is now correct. (BZ#675739)
  
  * The tomcat-5 resource agent no longer generates incorrect configurations.
  (BZ#637802)
  
  * The time required to stop an NFS resource when the server is unavailable
  has been reduced. (BZ#678494)
  
  * When using exclusive prioritization, a higher priority service now
  preempts a lower priority service after status check failures. (BZ#680256)
  
  * The postgres-8 resource agent now correctly detects failed start
  operations. (BZ#663827)
  
  * The handling of reference counts passed by rgmanager to resource agents
  now works properly, as expected. (BZ#692771)
  
  As well, this update adds the  ... 

  Description truncated, for more information please check the Reference URL";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "rgmanager on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-September/017958.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881000");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-09-23 16:39:49 +0200 (Fri, 23 Sep 2011)");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:1000");
  script_cve_id("CVE-2010-3389");
  script_name("CentOS Update for rgmanager CESA-2011:1000 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of rgmanager");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"rgmanager", rpm:"rgmanager~2.0.52~21.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
