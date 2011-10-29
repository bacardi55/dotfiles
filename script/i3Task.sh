#!/bin/bash

WORK="taf" # name of the work tag
PERSO="perso" #name of the personnal tag

# TAF
NB_TASK=`task long +"$WORK" | grep "$WORK" | wc -l`
NB_ACTIVE_TASK=`task long active +"$WORK" | grep "$WORK" | wc -l`
NB_TASK_DUE_TODAY=`task long +"$WORK" due:today | grep "$WORK" | wc -l`
NB_TASK_DUE_EOW=`task long +"$WORK" due:eow | grep "$WORK" | wc -l`

# PERSO
NB_TASK_PERSO=`task long +"$PERSO" | grep "$PERSO" | wc -l`
NB_ACTIVE_TASK_PERSO=`task long active +"$PERSO" | grep "$PERSO" | wc -l`
NB_TASK_DUE_TODAY_PERSO=`task long +"$PERSO" due:today | grep "$PERSO" | wc -l`
NB_TASK_DUE_EOW_PERSO=`task long +"$PERSO" due:eow | grep "$PERSO" | wc -l`

STRING="WK: $NB_ACTIVE_TASK/$NB_TASK ($NB_TASK_DUE_TODAY-$NB_TASK_DUE_EOW) | 55: $NB_ACTIVE_TASK_PERSO/$NB_TASK_PERSO ($NB_TASK_DUE_TODAY_PERSO-$NB_TASK_DUE_EOW_PERSO)"

echo $STRING
