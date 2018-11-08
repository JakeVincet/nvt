###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_smb_brute.nasl 12115 2018-10-26 09:30:41Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Ron Bowes
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803509");
  script_version("$Revision: 12115 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 11:30:41 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 18:59:58 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: smb-brute");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl");
  script_mandatory_keys("Tools/Present/nmap6.01", "Tools/Launch/nmap_nse");

  script_xref(name:"URL", value:"http://www.skullsecurity.org/blog/?p=164");
  script_xref(name:"URL", value:"http://www.skullsecurity.org/wiki/index.php/Passwords");

  script_add_preference(name:"userdb", value:"", type:"entry");
  script_add_preference(name:"brutelimit", value:"", type:"entry");
  script_add_preference(name:"randomseed", value:"", type:"entry");
  script_add_preference(name:"unpwdb.timelimit", value:"", type:"entry");
  script_add_preference(name:"unpwdb.userlimit", value:"", type:"entry");
  script_add_preference(name:"smblockout", value:"", type:"entry");
  script_add_preference(name:"smbport", value:"", type:"entry");
  script_add_preference(name:"passdb", value:"", type:"entry");
  script_add_preference(name:"smbbasic", value:"", type:"entry");
  script_add_preference(name:"smbsign", value:"", type:"entry");
  script_add_preference(name:"canaries", value:"", type:"entry");
  script_add_preference(name:"unpwdb.passlimit", value:"", type:"entry");

  script_tag(name:"summary", value:"Attempts to guess username/password combinations over SMB, storing discovered combinations  for use
in other scripts. Every attempt will be made to get a valid list of users and to  verify each
username before actually using them. When a username is discovered, besides  being printed, it is
also saved in the Nmap registry so other Nmap scripts can use it. That means that if you're going to
run 'smb-brute.nse', you should run other 'smb' scripts you want.  This checks
passwords in a case-insensitive way, determining case after a password is found, for Windows
versions before Vista.

This script is specifically targeted towards security auditors or penetration testers.  One example
of its use, suggested by Brandon Enright, was hooking up 'smb-brute.nse' to the database
of usernames and passwords used by the Conficker worm (the password list can be found at the
references), among other places. Then, the network is
scanned and all systems that would be infected by Conficker are  discovered.

From the penetration tester perspective its use is pretty obvious. By discovering weak passwords on
SMB, a protocol that's well suited for bruteforcing, access to a system can be gained.  Further,
passwords discovered against Windows with SMB might also be used on Linux or MySQL or custom Web
applications. Discovering a password greatly beneficial for a pen-tester.

This script uses a lot of little tricks that I (Ron Bowes) describe in detail in a blog posting (see references).
The tricks will be summarized here, but that blog is the best place to learn more.

Usernames and passwords are initially taken from the unpwdb library. If possible, the usernames are
verified as existing by taking advantage of Windows' odd behaviour with invalid username and invalid
password responses. As soon as it is able, this script will download a full list  of usernames from
actual accounts only.

SYNTAX:

userdb:  The filename of an alternate username database.

brutelimit:  Limits the number of usernames checked in the script. In some domains,
it's possible to end up with 10.000+ usernames on each server. By default, this
will be '5000', which should be higher than most servers and also prevent infinite
loops or other weird things. This will only affect the user list pulled from the
server, not the username list.

randomseed:    Set to a value to change the filenames/service names that are randomly generated.

unpwdb.timelimit:  The maximum amount of time that any iterator will run
before stopping. The value is in seconds by default and you can follow it
with 'ms', 's', 'm', or 'h' for
milliseconds, seconds, minutes, or hours. For example,
'unpwdb.timelimit=30m' or 'unpwdb.timelimit=.5h' for
30 minutes. The default depends on the timing template level (see the module
description). Use the value '0' to disable the time limit.

unpwdb.userlimit:  The maximum number of usernames
'usernames' will return (default unlimited).

smblockout:  This argument will force the script to continue if it
locks out an account or thinks it will lock out an account.

smbport:       Override the default port choice. If 'smbport' is open, it's used. It's assumed
to be the same protocol as port 445, not port 139. Since it probably isn't possible to change
Windows' ports normally, this is mostly useful if you're bouncing through a relay or something.

passdb:  The filename of an alternate password database.

smbbasic:     Forces the authentication to use basic security, as opposed to 'extended security'.
Against most modern systems, extended security should work, but there may be cases
where you want to force basic. There's a chance that you'll get better results for
enumerating users if you turn on basic authentication.

smbsign:       Controls whether or not server signatures are checked in SMB packets. By default, on Windows,
server signatures aren't enabled or required. By default, this library will always sign
packets if it knows how, and will check signatures if the server says to. Possible values are:

  - 'force':      Always check server signatures, even if server says it doesn't support them (will
probably fail, but is technically more secure).

  - 'negotiate': [default] Use signatures if server supports them.

  - 'ignore':    Never check server signatures. Not recommended.

  - 'disable':   Don't send signatures, at all, and don't check the server's. not recommended.
More information on signatures can be found in 'smbauth.lua'.

canaries:  Sets the number of tests to do to attempt to lock out the first account.
This will lock out the first account without locking out the rest of the accounts.
The default is 3, which will only trigger strict lockouts, but will also bump the
canary account up far enough to detect a lockout well before other accounts are
hit.

unpwdb.passlimit:  The maximum number of passwords
'passwords' will return (default unlimited).");

  script_tag(name:"solution_type", value:"Mitigation");

  exit(0);
}

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

i = 0;

port = script_get_preference("smbport");
if (port !~ '^[0-9]+$'){
  port = 445;
}

pref = script_get_preference("userdb");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'userdb', '=', pref, '"');
}
pref = script_get_preference("brutelimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'brutelimit', '=', pref, '"');
}
pref = script_get_preference("randomseed");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'randomseed', '=', pref, '"');
}
pref = script_get_preference("unpwdb.timelimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unpwdb.timelimit', '=', pref, '"');
}
pref = script_get_preference("unpwdb.userlimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unpwdb.userlimit', '=', pref, '"');
}
pref = script_get_preference("smblockout");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smblockout', '=', pref, '"');
}
pref = script_get_preference("smbport");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smbport', '=', pref, '"');
}
pref = script_get_preference("passdb");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'passdb', '=', pref, '"');
}
pref = script_get_preference("smbbasic");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smbbasic', '=', pref, '"');
}
pref = script_get_preference("smbsign");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smbsign', '=', pref, '"');
}
pref = script_get_preference("canaries");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'canaries', '=', pref, '"');
}
pref = script_get_preference("unpwdb.passlimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unpwdb.passlimit', '=', pref, '"');
}

argv = make_list("nmap", "--script=smb-brute.nse", "-p", port, get_host_ip());

if(i > 0) {
  scriptArgs = "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv, scriptArgs);
}

if(TARGET_IS_IPV6())
  argv = make_list(argv, "-6");

timing_policy = get_kb_item("Tools/nmap/timing_policy");
if(timing_policy =~ '^-T[0-5]$')
  argv = make_list(argv, timing_policy);

source_iface = get_preference("source_iface");
if(source_iface =~ '^[0-9a-zA-Z:_]+$') {
  argv = make_list(argv, "-e");
  argv = make_list(argv, source_iface);
}

res = pread(cmd:"nmap", argv:argv);

if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg, port:port);
    }
  }

  if("smb-brute" >< result) {
    msg = string('Result found by Nmap Security Scanner (smb-brute.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
