#!/bin/bash

WORK="taf" # name of the work tag
PERSO="perso" #name of the personnal tag
MAIL="raphael@khaiat.org"
MAIL_OBJECT="TODO LIST du `date +%d` `date +%B` `date +%G`"

echo "TODO LIST du `date +%d` `date +%B` `date +%G`

******** PRO ******** "> /tmp/task_intro

echo "


-------------------------------------
-------------------------------------
-------------------------------------


******* PERSO ******* " > /tmp/task_separator

# TAF
echo "TASK(S) FOR TODAY :" > /tmp/task_pre_today_work
task +"$WORK" due:today > /tmp/task_today_work

echo "

TASK(S) FOR THE END OF WEEK" > /tmp/task_pre_eow_work
task +"$WORK" due:eow > /tmp/task_eow_work

echo "

OPENED TASK(S)" > /tmp/task_pre_work
task +"$WORK" > /tmp/task_work

# PERSO
echo "
TASK(S) FOR TODAY :" > /tmp/task_pre_today_perso
task +"$PERSO" due:today > /tmp/task_today_perso

echo "

TASK(S) FOR THE END OF WEEK" > /tmp/task_pre_eow_perso
task +"$PERSO" due:eow > /tmp/task_eow_perso

echo "

OPENED TASK(S)" > /tmp/task_pre_perso
task +"$PERSO" > /tmp/task_perso

echo "

TIMESHEET" > /tmp/task_pre_timesheet
task timesheet > /tmp/task_timesheet

echo "

AU BOULOT ! :)" > /tmp/task_fin

cat /tmp/task_intro /tmp/task_pre_today_work /tmp/task_today_work /tmp/task_pre_eow_work /tmp/task_eow_work /tmp/task_pre_work /tmp/task_work /tmp/task_pre_today_perso /tmp/task_today_perso /tmp/task_pre_eow_perso /tmp/task_eow_perso /tmp/task_pre_perso /tmp/task_perso /tmp/task_pre_timesheet /tmp/task_timesheet /tmp/task_fin | mail -s "$MAIL_OBJECT" "$MAIL"
rm /tmp/task*
