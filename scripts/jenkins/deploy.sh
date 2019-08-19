#!/bin/bash

updateService () {
	serverIp=$1
	serverName=$2
	serviceName=$3
  
  echo "Updating service $serverIp - $serverName - $serviceName"
}

migrate () {
  echo "Migrating"  
}

doDeploy () {
	serverIp=$1
	serverName=$2
	shouldMigrate=$3
  
  echo "Deploying"
  
  if ! [ -z "$shouldMigrate" ]; then
    migrate
  fi

  pwd

  echo "Done"
}

SERVER_IP=$1
SERVER_NAME=$2
SHOULD_MIGRATE=$3

doDeploy $SERVER_IP $SERVER_NAME $SHOULD_MIGRATE

