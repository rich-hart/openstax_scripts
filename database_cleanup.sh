#!/bin/bash
# My first script
# chmod 755 hello_script
dropdb -U postgres --if-exists authoring
dropdb -U postgres --if-exists cnxarchive
dropdb -U postgres --if-exists cnxarchive-testing