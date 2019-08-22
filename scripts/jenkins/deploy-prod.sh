#!/bin/bash

bash ./scripts/jenkins/deploy.sh '1.2.3.4' 'prod'

sleep 5

exit 1

bash ./scripts/jenkins/deploy.sh '5.6.7.8' 'prod' true
