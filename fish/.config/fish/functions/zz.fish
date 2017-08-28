# ssh

function zz
  set host (cat ~/.ssh/config | grep "Host " | awk '{print $2}' | sort -u | fzf -q "$argv" -1 --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229,info:150,prompt:110,spinner:150,pointer:167,marker:174)
  if test -z $host
    return
  end
  echo ssh {$host}
  ssh {$host}
end