#!/bin/bash
if [ "$1" == "" ];then
  echo "Usage: php_ctags [type]";
  echo "Types are : ";
  echo "  - drupal";
  echo "  - framework";
  exit 0;
fi;

if [ "$1" == "drupal" ];then
  echo "running drupal ctags";
  exec ctags --langmap=php:.engine.inc.module.theme.install.php --php-kinds=cdfi --languages=php --recurse --exclude=".svn" --exclude="sites/default/"

elif [ "$1" == "framework" ];then
  echo "running framework ctags";
  exec ctags-exuberant
    -h \".php\" -R \
    --exclude=\"\.svn\" \
    --totals=yes \
    --tag-relative=yes \
    --PHP-kinds=+cf \
    --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
    --regex-PHP='/interface ([^ ]*)/\1/c/' \
    --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'
else
  echo "Not a valid type";
fi;
