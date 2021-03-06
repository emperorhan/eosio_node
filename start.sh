NODEOSBINDIR="/home/eos/eos/build/programs/nodeos"
DATADIR="$( jq -r '.DIR' "config.conf" )"
PRODUCER_NAME="$( jq -r '.ACCOUNT' "config.conf" )"
PUB_KEY="$( jq -r '.PUB_KEY' "config.conf" )"
PRIV_KEY="$( jq -r '.PRIV_KEY' "config.conf" )"

$DATADIR/stop.sh
echo -e "Starting Nodeos \n";

$NODEOSBINDIR/nodeos -p $PRODUCER_NAME --signature-provider=$PUB_KEY=KEY:$PRIV_KEY --delete-all-blocks --genesis-json $DATADIR/genesis.json --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
#$NODEOSBINDIR/nodeos -p $PRODUCER_NAME --signature-provider=$PUB_KEY=KEY:$PRIV_KEY --replay-blockchain --contracts-console --genesis-json $DATADIR/genesis.json --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid 
#$NODEOSBINDIR/nodeos -p $PRODUCER_NAME --signature-provider=$PUB_KEY=KEY:$PRIV_KEY --contracts-console --genesis-json $DATADIR/genesis.json --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
