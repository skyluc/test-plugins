#!/bin/bash

ROOT_DIR=$(dirname $0)
cd ${ROOT_DIR}
ROOT_DIR=${PWD}

call_maven() {
  mvn clean package
  RES=$?
  if [ ${RES} != 0 ]
  then
    exit ${RES}
  fi
}

cd ${ROOT_DIR}/master
call_maven

cd ${ROOT_DIR}
./updateVersions.sh

cd ${ROOT_DIR}/slave1
call_maven

cd ${ROOT_DIR}/slave2
call_maven

cd ${ROOT_DIR}/ecosystem
call_maven
