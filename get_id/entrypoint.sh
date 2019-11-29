#!/bin/bash

if [ ! -f /home/get_id/id.env ]; then
    echo export USER_ID=$(id -u $USER) > /home/get_id/id.env
    echo export GROUP_ID=$(id -g $USER) >> /home/get_id/id.env
else
    . /home/get_id/id.env
    env
fi

