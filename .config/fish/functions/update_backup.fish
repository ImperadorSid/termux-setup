#!/usr/bin/env fish

function update_backup
  B status -s
  set files (B status -s | awk '{ print $2 }')

  if test -n "$files"
    B add -u
    read -P 'Commit message> ' msg
    B commit -m $msg
    B push -q
  end

end

