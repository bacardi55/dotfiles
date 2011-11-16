#!/bin/bash

WORK="taf" # name of the work tag
PERSO="perso" #name of the personnal tag
MAIL_PERSO="raphael@khaiat.org"
MAIL_PERSO_OBJECT="[PERSO] Bilan mensuel de `date +%B`"
MAIL_WORK="raphael@khaiat.org"
MAIL_WORK_OBJECT="[WORK] Bilan mensuel de `date +%B`"

TASK=`which task`

echo "BILAN MENSUEL DU MOIS de `date +%B`

******** PRO ******** "> /tmp/task_work_intro
# TAF
"$TASK" sum +"$WORK" > /tmp/task_sum_work
"$TASK" history.monthly +"$WORK" > /tmp/task_hist_work
"$TASK" ghistory.monthly +"$WORK" > /tmp/task_ghist_work


cat /tmp/task_work_intro /tmp/task_hist_work /tmp/task_ghist_work /tmp/task_sum_work | mail -s "$MAIL_WORK_OBJECT" "$MAIL_WORK"
rm /tmp/task*


echo "BILAN MENSUEL DU MOIS de `date +%B`

******* PERSO ******* " > /tmp/task_perso_intro

# PERSO
"$TASK" sum +"$PERSO" > /tmp/task_sum_perso
"$TASK" history.monthly +"$PERSO" > /tmp/task_hist_perso
"$TASK" ghistory.monthly +"$PERSO" > /tmp/task_ghist_perso


cat /tmp/task_perso_intro /tmp/task_hist_perso /tmp/task_ghist_perso /tmp/task_sum_perso | mail -s "$MAIL_PERSO_OBJECT" "$MAIL_PERSO"
rm /tmp/task*
