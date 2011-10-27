#!/bin/bash

ssh-agent > /tmp/ssh-agent
. /tmp/ssh-agent
rm /tmp/ssh-agent

ssh-add

dvcs-autosync
