###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M4_178.nasl 10646 2018-07-27 07:00:22Z cfischer $
#
# GSHB, 10. EL, Ma�nahme 4.178
#
# Authors:
# Thomas Rotter <T.Rotter@dn-systems.de>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.894178");
  script_version("$Revision: 10646 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-27 09:00:22 +0200 (Fri, 27 Jul 2018) $");
  script_tag(name:"creation_date", value:"2010-01-28 16:39:01 +0100 (Thu, 28 Jan 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("IT-Grundschutz M4.178: Absicherung der Administrator- und Benutzerkonten beim IIS-Einsatz (Windows)");
  script_xref(name:"URL", value:"http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m04/m04178.html");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"general_note");
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("IT-Grundschutz-11");
  script_mandatory_keys("Compliance/Launch/GSHB-11", "Tools/Present/wmi");
  script_dependencies("GSHB/GSHB_WMI_WinAdminTools.nasl", "GSHB/GSHB_WMI_PasswdPolicie.nasl", "GSHB/GSHB_WMI_Passfilt.nasl", "GSHB/GSHB_WMI_OSInfo.nasl");
  script_require_keys("WMI/AdminTools");

  script_tag(name:"summary", value:"IT-Grundschutz M4.178: Absicherung der Administrator- und Benutzerkonten beim IIS-Einsatz (Windows).

  ACHTUNG: Dieser Test wird nicht mehr unterst�tzt. Er wurde zudem in neueren
  EL gestrichen.

  Diese Pr�fung bezieht sich auf die 11. Erg�nzungslieferung (11. EL) des IT-
  Grundschutz. Die detaillierte Beschreibung zu dieser Ma�nahme findet sich unter
  nachfolgendem Verweis. Es ist zu beachten, dass der dortige Text sich immer auf
  die aktuellste Erg�nzungslieferung bezieht. Titel und Inhalt k�nnen sich bei einer
  Aktualisierung �ndern, allerdings nicht die Kernthematik.

  Hinweis:

  Es wird ledliglich ein Hinweis auf SYSKEY und Passpro.exe gegeben.");

  script_tag(name:"deprecated", value:TRUE);

  exit(0);
}

exit(66);
