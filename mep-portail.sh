#!/bin/sh

#@author Raphael khaiat
#@param nom du nouveau tag
# Ce script à pour but de faciliter la création d'un tag
# svn. Il permet de copier le trunk dans un nouveau tag
# passé en paramètre et de faire un checkout du nouveau
# tag et de supprimer les fichiers / dossiers .svn afin
# d'avoir le répertoire prêt à être mis en production

### Configuration
# local address of your repository (where there are the folder trunk / tag)
REP_SVN="/home/rkhaiat/workspace/prod/portail-scpo/"
# where you want to checkout the new tag
REP_MEP="/home/rkhaiat/workspace/mep/portail"
# the URL of the repository
URL_REPO="https://forge.linagora.com/svn/portail-scpo/"
# The name of the tags folder (usually tags)
TAG_FOLDER="tags/"
# Commit message if none has been sent
DATE=`date +"%d/%m/%y"`
MESSAGE_COMMIT="ajout du tag de la mep du $DATE"

### Fonction 
printMessage(){
  if [ -z $DISPLAY ]; then
    echo "$1 - $2"
  else 
    echo "$1 - $2"
    notify-send "$1" "$2" >&2 2> /dev/null
  fi
}

### VÉRIFICATION
if [ $# -lt 1 ]; then
  printMessage "MEP PORTAIL" "utilisation : mep-portail nomDuTag"
  exit 1
fi

which svn > /dev/null
if [ $? -eq 1 ]; then
  printMessage "MEP PORTAIL" "Vous devez installer SVN"
  exit 1
fi

if [ ! -d $REP_SVN ]; then
  printMessage "MEP PORTAIL" "Mauvaise configuration du répertoire SVN"
  exit 1
fi

if [ ! -d $REP_MEP ]; then
  printMessage "MEP PORTAIL" "Mauvaise configuration du répertoire MEP"
  exit 1
fi

if [ ! -z "$2" ]; then
  MESSAGE_COMMIT="$MESSAGE_COMMIT : $2"
fi

### Script begins here!
printMessage "MEP PORTAIL" "begin script mep portail"

cd $REP_SVN

printMessage "MEP PORTAIL" "Begin svn up"

svn up trunk
printMessage "MEP PORTAIL" "SVN updated"

printMessage "MEP PORTAIL" "Copy trunk in tags/$1"
svn copy trunk tags/$1
printMessage "MEP PORTAIL" "Trunk has been correctly copied"

svn ci -m "$MESSAGE_COMMIT"
printMessage "MEP PORTAIL" "Ajout du tag mep $DATE"

cd $REP_MEP

printMessage "MEP PORTAIL" "Checkout tags $1"
svn co $URL_REPO$TAG_FOLDER$1
printMessage "MEP PORTAIL" "Tag $1 has been checkouted correctly"

cd $1

printMessage "MEP PORTAIL" "delete .svn folders"
find . -name ".svn" -type d -exec rm -rf {} \;
printMessage "MEP PORTAIL" ".svn folders have been deleted"

printMessage "MEP PORTAIL" "The new tag $1 has been created and is ready to be pushed in production"

# You can add here the command line you use to put files directly on the server 
# (rsync, scp, (l)ftp, ...)
