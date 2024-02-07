#!/bin/bash

LOG_FILE="/var/log/security_scan.log"

debsecan --suite=bullseye --only-fixed --format detail >> $LOG_FILE 2>&1
