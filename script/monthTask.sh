#!/bin/bash

WORK="taf" # name of the work tag
PERSO="perso" #name of the personnal tag



echo " BILAN MENSUEL DU MOIS `date +%B`

******** PRO ******** "> /tmp/task_intro
echo "


-------------------------------------
-------------------------------------
-------------------------------------


******* PERSO ******* " > /tmp/task_separator

# TAF
task sum +"$WORK" > /tmp/task_sum_work
task history.monthly +"$WORK" > /tmp/task_hist_work
task ghistory.monthly +"$WORK" > /tmp/task_ghist_work

# PERSO
task sum +"$PERSO" > /tmp/task_sum_perso
task history.monthly +"$PERSO" > /tmp/task_hist_perso
task ghistory.monthly +"$PERSO" > /tmp/task_ghist_perso


cat /tmp/task_intro /tmp/task_hist_work /tmp/task_ghist_work /tmp/task_sum_work /tmp/task_separator /tmp/task_hist_perso /tmp/task_ghist_perso /tmp/task_sum_perso | mail -s "testounet" raphael@khaiat.org
rm /tmp/task*
