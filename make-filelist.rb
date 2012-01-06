# -*- coding: utf-8 -*-

$EXCLUDE_PATH = %w[
. .. backup backup1 backup2 backup-system lost+found tmp temp
.cache w3mtmp proxy-cache trash proc RCS.old var img export exports
autom4te.cache blib _build .bzr .cdv cover_db CVS _darcs ~.dep ~.dot .git .hg ~.nib .pc ~.plst RCS SCCS _sgbak .svn
]

# Exclude regexps (backup files, core files, and so on)
$EXCLUDE_REGEXP = Regexp.union(/~$/, /\#.+\#$/, /[._].*\.swp$/, /core\.\d+$/, # from ack-grep
                               /\.(?:elc|o)$/, /,v$/,
                               /\.DS_Store$/, /\.localized$/, /\.vmwarevm$/, /\.app$/,
                               /\.(jpg|gif|png)$/, /\.(pdf|docx?|dotx?|xlsx?|xltx?|pptx?|potx?)$/,
                               /\.(7z|gz|rar|zip)$/
                               )

# Set default directories to collect
$LS_DIRS = [
            "~/.emacs.d", "~/etc/conf.d",
            "~/Code", "~/Documents/org"
           ]
