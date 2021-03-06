#!/usr/local/bin/zsh
setopt extendedglob
zmodload zsh/zpty
zpty copy "cp $@ 2>&1"     
ZPTYPID=${${=${(M)${(f)"$(ps -o pid,ppid,command)"}:#[[:space:]]#[[:digit:]]##[[:space:]][[:space:]]#$$*zsh*}}[1]}
CPPID=${${=${(M)${(f)"$(ps -o pid,ppid,command)"}:#[[:space:]]#[[:digit:]]##[[:space:]][[:space:]]#${ZPTYPID}*cp*}}[1]}
line=""
while [ : ]
do
    zpty -rt copy out
    if [[ $#out -gt 0 ]]
    then
        newline=${${=${out}}[0,-2]}
        percent=${${=${out}}[-1]}
        if [[ -z $line || "x$newline" != "x$line" ]]
        then
            [[ -n $line ]] && print "${line}: done"
            line=$newline
            print "${line}: ${(l: ::4:)percent}\c"
        else
            print "\r${line}: ${(l: ::4:)percent}\c"
        fi
    fi
        kill -SIGINFO $CPPID 2>/dev/null || break
done
[[ -n $line ]] && print "${line}: done"
zpty -d copy
