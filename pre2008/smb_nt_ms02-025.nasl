###############################################################################
# OpenVAS Vulnerability Test
# $Id: smb_nt_ms02-025.nasl 10213 2018-06-15 10:04:26Z cfischer $
#
# Exchange 2000 Exhaust CPU Resources (Q320436)
#
# Authors:
# Michael Scheidell <scheidell at secnap.net>
# Updated: 2009/04/23
# Chandan S <schandan@secpod.com>
#
# Copyright:
# Copyright (C) 2002 Michael Scheidell
# Copyright (C) 2002 SECNAP Network Security, LLC.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.11143");
  script_version("$Revision: 10213 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-15 12:04:26 +0200 (Fri, 15 Jun 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(4881);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2002-0368");
  script_name("Exchange 2000 Exhaust CPU Resources (Q320436)");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2002 Michael Scheidell");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/registry_enumerated");

  script_tag(name:"summary", value:"Malformed Mail Attribute can Cause Exchange 2000 to Exhaust CPU
  Resources (Q320436)");

  script_tag(name:"impact", value:"Denial of Service.");

  script_tag(name:"solution", value:"The vendor has released updates, please see http://www.microsoft.com/technet/security/bulletin/ms02-025.mspx");

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("secpod_reg.inc");

server = hotfix_check_nt_server();
if (!server) exit (0);

vers = hotfix_check_exchange_installed();
if ( vers == NULL ) exit(0);

if (hotfix_missing (name:"320436") > 0 )
  security_message(port:0);
