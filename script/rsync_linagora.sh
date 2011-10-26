#!/bin/bash

rsync -e ssh -avz --delete-after /home/bacardi55/linagora aoshi:
rsync -e ssh -avz --delete-after /home/bacardi55/.thunderbird aoshi:
