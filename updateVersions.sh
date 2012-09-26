#!/bin/bash

ROOT_DIR=$(dirname $0)
cd ${ROOT_DIR}
ROOT_DIR=${PWD}

MASTER_VERSION=$(grep -u 'Bundle-Version' ${ROOT_DIR}/master/org.skyluc.master/target/MANIFEST.MF | tr -d '\r' | awk -F ' ' '{print $2;}')

echo ${MASTER_VERSION}

for SLAVE in "slave1" "slave2"
do
  SLAVE_BASE_MANIFEST="${ROOT_DIR}/${SLAVE}/org.skyluc.${SLAVE}/META-INF/MANIFEST.MF"

  if [ ! -f ${SLAVE_BASE_MANIFEST}.orig ]
  then
    cp ${SLAVE_BASE_MANIFEST} ${SLAVE_BASE_MANIFEST}.orig
  fi

  sed "s/org.skyluc.master/org.skyluc.master;bundle-version=${MASTER_VERSION}/" ${SLAVE_BASE_MANIFEST}.orig > ${SLAVE_BASE_MANIFEST}
done
