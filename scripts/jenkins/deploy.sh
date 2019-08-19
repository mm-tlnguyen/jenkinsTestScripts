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
	shouldNotMigrate=$3
  
	echo "Deploying"

	if [ -z "$shouldNotMigrate" ]; then
		migrate
	fi

	pwd

	cd ./scripts/jenkins
	
	pwd
	
	cd ../..
	
	pwd
	
	updateService $serverIp $serverName 'service-1'
	updateService $serverIp $serverName 'service-2'
	updateService $serverIp $serverName 'service-3'
    
	echo "Done"
}

SERVER_IP=$1
SERVER_NAME=$2
SHOULD_NOT_MIGRATE=$3

doDeploy $SERVER_IP $SERVER_NAME $SHOULD_NOT_MIGRATE

