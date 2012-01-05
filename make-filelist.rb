# -*- coding: utf-8 -*-
# @Updated 2011-09-17

$EXCLUDE_PATH = %w[
. .. backup backup1 backup2 backup-system lost+found tmp temp
.cache w3mtmp proxy-cache trash proc RCS.old var img export exports
autom4te.cache blib _build .bzr .cdv cover_db CVS _darcs ~.dep ~.dot .git .hg ~.nib .pc ~.plst RCS SCCS _sgbak .svn
]

# Exclude regexps (backup files, core files, and so on)
$EXCLUDE_REGEXP = Regexp.union(/~$/, /\#.+\#$/, /[._].*\.swp$/, /core\.\d+$/, # from ack-grep
  /\.DS_Store$/, /\.localized$/, /\.vmwarevm$/, /\.app$/, /Microsoft/, # Mac
  /\.(?:elc|o)$/, /,v$/, /\.cdb$/,
  /\.kdb$/, /\.(jpg|gif|png)$/, /\.(pdf|doc|docx|dotx|xls|xlsx|xltx|ppt|pptx|potx)$/,
  /\.(7z|gz|rar|zip)$/, # archiver
  /\.(iso|dmg)$/ # image file
)

# Set default directories to collect
$LS_DIRS = [
  "~/.emacs.d", "~/etc",
  "~/Code", "~/Documents"
]
