###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_http_iis_webdav_vuln_net.nasl 11530 2018-09-21 18:36:13Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Ron Bowes and Andrew Orr
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
  script_oid("1.3.6.1.4.1.25623.1.0.104020");
  script_version("$Revision: 11530 $");
  script_cve_id("CVE-2009-1122", "CVE-2009-1535");
  script_bugtraq_id(35232);
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 20:36:13 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_name("Nmap NSE net: http-iis-webdav-vuln");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"http.pipeline", value:"", type:"entry");
  script_add_preference(name:"http.useragent", value:"", type:"entry");
  script_add_preference(name:"basefolder", value:"", type:"entry");
  script_add_preference(name:"folderdb", value:"", type:"entry");
  script_add_preference(name:"http-max-cache-size", value:"", type:"entry");
  script_add_preference(name:"webdavfolder", value:"", type:"entry");

  script_tag(name:"summary", value:"Checks for a vulnerability in IIS 5.1/6.0 that allows arbitrary users to access secured WebDAV
folders by searching for a password-protected folder and attempting to access it. This vulnerability
was patched in Microsoft Security Bulletin MS09-020, http://nmap.org/r/ms09-020.

A list of well known folders (almost 900) is used by default. Each one is checked, and if returns an
authentication request (401), another attempt is tried with the malicious encoding. If that attempt
returns a successful result (207), then the folder is marked as vulnerable.

This script is based on the Metasploit
modules/auxiliary/scanner/http/wmap_dir_webdav_unicode_bypass.rb auxiliary module.

For more information on this vulnerability and script, see:

  - http://blog.zoller.lu/2009/05/iis-6-webdac-auth-bypass-and-data.html

  - http://seclists.org/fulldisclosure/2009/May/att-134/IIS_Advisory_pdf.bin

  - http://www.skullsecurity.org/blog/?p=271 * http://www.kb.cert.org/vuls/id/787932

  - http://www.microsoft.com/technet/security/advisory/971492.mspx

SYNTAX:

http.pipeline:  If set, it represents the number of HTTP requests that'll be
pipelined (ie, sent in a single request). This can be set low to make
debugging easier, or it can be set high to test how a server reacts (its
chosen max is ignored).


http.useragent:  The value of the User-Agent header field sent with
requests. By default it is
''Mozilla/5.0 (compatible; Nmap Scripting Engine; http://nmap.org/book/nse.html)''.
A value of the empty string disables sending the User-Agent header field.



basefolder:  The folder to start in; eg, ''/web'' will try ''/web/xxx''.



folderdb:  The filename of an alternate list of folders.


http-max-cache-size:  The maximum memory size (in bytes) of the cache.



webdavfolder:  Selects a single folder to use, instead of using a built-in list.");

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

    pref = script_get_preference("http.pipeline");
    if (!isnull(pref) && pref != "") {
        argv["http.pipeline"] = string('"', pref, '"');
    }
    pref = script_get_preference("http.useragent");
    if (!isnull(pref) && pref != "") {
        argv["http.useragent"] = string('"', pref, '"');
    }
    pref = script_get_preference("basefolder");
    if (!isnull(pref) && pref != "") {
        argv["basefolder"] = string('"', pref, '"');
    }
    pref = script_get_preference("folderdb");
    if (!isnull(pref) && pref != "") {
        argv["folderdb"] = string('"', pref, '"');
    }
    pref = script_get_preference("http-max-cache-size");
    if (!isnull(pref) && pref != "") {
        argv["http-max-cache-size"] = string('"', pref, '"');
    }
    pref = script_get_preference("webdavfolder");
    if (!isnull(pref) && pref != "") {
        argv["webdavfolder"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"http-iis-webdav-vuln", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"http-iis-webdav-vuln");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (http-iis-webdav-vuln.nse) http://nmap.org:\n\n';
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