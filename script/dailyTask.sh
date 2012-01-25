#!/bin/bash

WORK="taf" # name of the work tag
PERSO="perso" #name of the personnal tag
MAIL_PERSO="raphael@khaiat.org"
MAIL_PERSO_OBJECT="[PERSO] Todolist du `date +%d` `date +%B` `date +%G`"
MAIL_WORK="raphael@khaiat.org"
MAIL_WORK_OBJECT="[WORK] Todolist du `date +%d` `date +%B` `date +%G`"

TASK=`which task`

echo "TODO LIST du `date +%d` `date +%B` `date +%G`

******** PRO ******** "> /tmp/task_work_intro

# TAF
echo "TASK(S) FOR TODAY :" > /tmp/task_pre_today_work
/usr/local/bin/task ls +"$WORK" due:today > /tmp/task_today_work
"$TASK" ls +"$WORK" due:today > /tmp/task_today_work

echo "

TASK(S) FOR THE END OF WEEK" > /tmp/task_pre_eow_work
"$TASK" ls +"$WORK" due:eow > /tmp/task_eow_work

echo "

OPENED TASK(S)" > /tmp/task_pre_work
"$TASK" ls +"$WORK" > /tmp/task_work

echo "

AU BOULOT ! :)" > /tmp/task_work_fin

cat /tmp/task_work_intro /tmp/task_pre_today_work /tmp/task_today_work /tmp/task_pre_eow_work /tmp/task_eow_work /tmp/task_pre_work /tmp/task_work /tmp/task_work_fin | mail -s "$MAIL_WORK_OBJECT" "$MAIL_WORK"
rm /tmp/task*


echo "TODO LIST du `date +%d` `date +%B` `date +%G`

******* PERSO ******* " > /tmp/task_perso_intro

# PERSO
echo "
TASK(S) FOR TODAY :" > /tmp/task_pre_today_perso
"$TASK" ls +"$PERSO" due:today > /tmp/task_today_perso

echo "

TASK(S) FOR THE END OF WEEK" > /tmp/task_pre_eow_perso
"$TASK" ls +"$PERSO" due:eow > /tmp/task_eow_perso

echo "

OPENED TASK(S)" > /tmp/task_pre_perso
"$TASK" ls +"$PERSO" > /tmp/task_perso

echo "

TIMESHEET" > /tmp/task_pre_timesheet
"$TASK" timesheet > /tmp/task_timesheet

echo "

AU BOULOT ! :)" > /tmp/task_perso_fin

cat /tmp/task_perso_intro /tmp/task_pre_today_perso /tmp/task_today_perso /tmp/task_pre_eow_perso /tmp/task_eow_perso /tmp/task_pre_perso /tmp/task_perso /tmp/task_pre_timesheet /tmp/task_timesheet /tmp/task_perso_fin | mail -s "$MAIL_PERSO_OBJECT" "$MAIL_PERSO"
rm /tmp/task*

