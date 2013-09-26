#!/usr/bin/python
import re, subprocess

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
