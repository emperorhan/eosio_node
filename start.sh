#!/bin/bash
################################################################################
#
# Script for IBCT private_net
# https://github.com/junep89/ibctprivate
#
###############################################################################


NODEOSBINDIR="/home/eos/eos/build/programs/nodeos"
DATADIR="$( jq -r '.DIR' "config.conf" )"

$DATADIR/stop.sh
echo -e "Starting Nodeos \n";

$NODEOSBINDIR/nodeos  --delete-all-blocks --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
#$NODEOSBINDIR/nodeos --replay-blockchain --contracts-console --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid 
#$NODEOSBINDIR/nodeos  --contracts-console --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
