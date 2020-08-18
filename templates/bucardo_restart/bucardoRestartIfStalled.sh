#!/bin/bash
NEEDS_RESTART=`sudo -u postgres psql -qAt -U postgres -d bucardo -c "select count(*) from bucardo.sync where status!='active'" | tr -d [:space:]`;

if [ "$NEEDS_RESTART" != "0" ] ;
then
        su - bucardo -c "bucardo deactivate all"
        sleep 5
        su - bucardo -c "bucardo validate all"
        sleep 10
        su - bucardo -c "bucardo activate all"
        sleep 10
        su - bucardo -c "bucardo kick all"
        sleep 10
        su - bucardo -c "bucardo stop"
        sleep 10
        su - bucardo -c "bucardo start"
        sleep 10
        su - bucardo -c "bucardo kick all"
        sleep 10
fi
