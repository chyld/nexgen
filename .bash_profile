source ~/.bashrc
source ~/.profile

txt0='\[\e[0;30m\]'
txt1='\[\e[0;31m\]'
txt2='\[\e[0;32m\]'
txt3='\[\e[0;33m\]'
txt4='\[\e[0;34m\]'
txt5='\[\e[0;35m\]'
txt6='\[\e[0;36m\]'
txt7='\[\e[0;37m\]'
txtrst='\[\e[0m\]'    # Text Reset

branch()
{
  git branch 2> /dev/null | awk '/\*/ {print "{" $2 "} ";}'
}

status()
{
  git status --porcelain 2> /dev/null | wc | awk '{if($1 > 0)print"+";}'
}

export PS1="$txt3\u$txt7@$txt2\h $txt4\w $txt1\$(status)$txt5\$(branch)$txt3>$txtrst "
