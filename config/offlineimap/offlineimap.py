#!/usr/bin/python
import re, os, subprocess

# https://github.com/rodjek/dotfiles/blob/master/.mutt/offlineimap.py
def get_keychain_password(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command':  'find-internet-password',
        'account':  account,
        'server':   server,
        'keychain': '~/Library/Keychains/login.keychain',
    }
    command = "%(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
    output  = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
               if l.startswith('password: ')][0]

    return re.match(r'password: "(.*)"', outtext).group(1)

# http://quotenil.com/OfflineIMAP-with-Encrypted-Authinfo.html
def get_authinfo_password(machine, login, port):
    fields    = "machine %s login %s port %s password ([^ ]*)\n" % (machine, login, port)
    passfield = re.compile(fields)
    command   = "gpg -q --no-batch -d ~/.authinfo.gpg"
    authinfo  = os.popen(command).read()

    return passfield.search(authinfo).group(1)
