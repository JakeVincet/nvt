###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_oracle_brute_net.nasl 12117 2018-10-26 10:50:36Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Patrik Karlsson
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.104043");
  script_version("$Revision: 12117 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:50:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Nmap NSE net: oracle-brute");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"brute.firstonly", value:"", type:"entry");
  script_add_preference(name:"oracle-brute.sid", value:"", type:"entry");
  script_add_preference(name:"brute.retries", value:"", type:"entry");
  script_add_preference(name:"tns.sid", value:"", type:"entry");
  script_add_preference(name:"brute.mode", value:"", type:"entry");
  script_add_preference(name:"brute.useraspass", value:"", type:"entry");
  script_add_preference(name:"brute.passonly", value:"", type:"entry");
  script_add_preference(name:"brute.credfile", value:"", type:"entry");
  script_add_preference(name:"brute.unique", value:"", type:"entry");
  script_add_preference(name:"brute.threads", value:"", type:"entry");
  script_add_preference(name:"brute.delay", value:"", type:"entry");

  script_tag(name:"summary", value:"Performs brute force password auditing against Oracle servers.

SYNTAX:

brute.firstonly:  stop guessing after first password is found
(default: false)

oracle-brute.sid:  the instance against which to perform password
guessing

brute.retries:  the number of times to retry if recoverable failures
occurs. (default: 3)

tns.sid:  specifies the Oracle instance to connect to

brute.mode:  can be user, pass or creds and determines what mode to run
the engine in.

  - user - the unpwdb library is used to guess passwords, every password
password is tried for each user. (The user iterator is in the
outer loop)

  - pass - the unpwdb library is used to guess passwords, each password
is tried for every user. (The password iterator is in the
outer loop)

  - creds- a set of credentials (username and password pairs) are
guessed against the service. This allows for lists of known
or common username and password combinations to be tested.
If no mode is specified and the script has not added any custom
iterator the pass mode will be enabled.

brute.useraspass:  guess the username as password for each user
(default: true)

brute.passonly:  iterate over passwords only for services that provide
only a password for authentication. (default: false)

brute.credfile:  a file containing username and password pairs delimited
by '/'

brute.unique:  make sure that each password is only guessed once
(default: true)

brute.threads:  the number of initial worker threads, the number of
active threads will be automatically adjusted.

brute.delay:  the number of seconds to wait between guesses (default: 0)");

  script_tag(name:"solution_type", value:"Mitigation");

  exit(0);
}

include("nmap.inc");

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

phase = 0;
if (defined_func("scan_phase")) {
  phase = scan_phase();
}

if (phase == 1) {
    argv = make_array();

    pref = script_get_preference("brute.firstonly");
    if (!isnull(pref) && pref != "") {
        argv["brute.firstonly"] = string('"', pref, '"');
    }
    pref = script_get_preference("oracle-brute.sid");
    if (!isnull(pref) && pref != "") {
        argv["oracle-brute.sid"] = string('"', pref, '"');
    }
    pref = script_get_preference("brute.retries");
    if (!isnull(pref) && pref != "") {
        argv["brute.retries"] = string('"', pref, '"');
    }
    pref = script_get_preference("tns.sid");
    if (!isnull(pref) && pref != "") {
        argv["tns.sid"] = string('"', pref, '"');
    }
    pref = script_get_preference("brute.mode");
    if (!isnull(pref) && pref != "") {
        argv["brute.mode"] = string('"', pref, '"');
    }
    pref = script_get_preference("brute.useraspass");
    if (!isnull(pref) && pref != "") {
        argv["brute.useraspass"] = string('"', pref, '"');
    }
    pref = script_get_preference("brute.passonly");
    if (!isnull(pref) && pref != "") {
        argv["brute.passonly"] = string('"', pref, '"');
    }
    pref = script_get_preference("brute.credfile");
    if (!isnull(pref) && pref != "") {
        argv["brute.credfile"] = string('"', pref, '"');
    }
    pref = script_get_preference("brute.unique");
    if (!isnull(pref) && pref != "") {
        argv["brute.unique"] = string('"', pref, '"');
    }
    pref = script_get_preference("brute.threads");
    if (!isnull(pref) && pref != "") {
        argv["brute.threads"] = string('"', pref, '"');
    }
    pref = script_get_preference("brute.delay");
    if (!isnull(pref) && pref != "") {
        argv["brute.delay"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"oracle-brute", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"oracle-brute");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (oracle-brute.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            security_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            security_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}
