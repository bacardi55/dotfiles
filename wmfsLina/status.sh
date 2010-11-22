#!/bin/sh

#COLOR

SC="\\#555555\\"
NC="\\#CCCCCC\\"
TC="\\#FE0000\\"
BL="\\#FFFFFF\\"
NO="\\#000000\\"

calc()
{
     echo "`echo $1 | bc -l | cut -d. -f1`"
}

#progressbar x y w h bordcolor bgcolor barcolor value maxvalue
progressbar()
{
    local BARH=`calc "$8/$9*$3"`
    local BORD=" \b[`calc \"$1 - 1\"`;`calc \"$2 - 1\"`;`calc \"$3 + 2\"`;`calc \"$4 + 2\"`;$5]\ "
    local BGBAR=" \b[$1;$2;$3;$4;$6]\ "
    local VBAR=" \b[$1;$2;$BARH;$4;$7]\ "

    echo "$BORD$BGBAR$VBAR"
}

# DATE
DATE=`date +"%H:%M %d/%m/%y"`
HEURE="$SC |$NC $DATE"

#Name 
USER=`whoami`
NAME=`uname -n`
ME="$NC$USER$SC@$NC$NAME$SHL$SC |"

#VOLUME BAR
#SOUND=`amixer -c 0 sset "PCM" 0%+ | grep "Front Left:" | awk -F "%" {'print $1'} | awk -F "[" {'print $2'}`
#VOLUME="$NC                 $SOUND %"
#IMG_VOL="\i[1050;1;20;20;/home/bacardi55/.config/wmfs/images/sound.png]\  "
#VOLBAR=`progressbar 1080 5 55 9 '#FFFFFF' '#000000' '#FE0000' $SOUND 100`
#VOL1="$VOLBAR$IMG_VOL$VOLUME"

#CPU BAR
#CPU=`top -n2 -d0.1 | grep "Cpu" | awk {'print $2'} | cut -d. -f1 | tail -n1`
#CPUBAR=`progressbar 985 5 55 9 '#FFFFFF' '#000000' '#FE0000' $CPU 100`
#IMG_CPU="\i[950;1;20;20;/home/bacardi55/.config/wmfs/images/cpu.jpg]\  "
#CPU="$NC           "
#CPUF="$CPUBAR$IMG_CPU$CPU"

# Musique
SONG=`mocp -i | grep SongTitle | awk -F ": " '{print $2}'`
ARTIST=`mocp -i | grep Artist | awk -F ": " '{print $2}'`
if [ -z "$ARTIST"]; then
    MOCP=""
else
    MOCP="$NC listenning$TC $SONG$SC ( $NC$ARTIST$SC )"
fi;

# Mail
MAIL=`python /home/bacardi55/.config/wmfs/imap.py | grep UNSEEN | awk {'print $2'}`
if [ "$MAIL" == '0' ]; then
    SMAIL="$SC 0 "
else
    SMAIL="$TC $MAIL "
fi;
IMG_EMAIL="\i[1145;1;20;20;/home/bacardi55/.config/wmfs/images/email.png]\  "
EMAIL="$IMG_EMAIL$SMAIL"

# prochain rdv : 
RV=`calcurse -n | grep "\[[0-9]*:[0-9]*\]" | awk -F "] " '{print $2}'`
RDV="$NC RDV:$TC $RV $SC |"

# HL irssi :
scp kim:~/.irssi/fnotify ~/.fnotify
IRSSI=`tail -n1 /home/bacardi55/.fnotify`
if [ -z "$IRSSI" ]; then
    HL="    "
else
    HL="$TC HL: $IRSSI$SC |    "
fi;

ECRAN0="$ME$HL$EMAIL$HEURE"
ECRAN1="$ME$HL$RDV$MOCP$HEURE"

/usr/local/bin/wmfs -s 0 "$ECRAN0"
/usr/local/bin/wmfs -s 1 "$ECRAN1"
