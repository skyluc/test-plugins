#!/bin/sh

ROOT_DIR=$(dirname $0)
cd ${ROOT_DIR}
ROOT_DIR=${PWD}


cd ${ROOT_DIR}

# reset
git checkout .

rm -rf target
mkdir -p target

# v1
./buildOnce.sh

cp -r ecosystem/target/site target/site-v1-all

# v2
./buildOnce.sh

cp -r ecosystem/target/site target/site-v2-all

# v3
./buildOnce.sh

cp ecosystem/site.xml-nos2 ecosystem/site.xml

cd ${ROOT_DIR}/ecosystem
mvn clean package

cd ${ROOT_DIR}
cp -r ecosystem/target/site target/site-v3-nos2

# compose
cd ${ROOT_DIR}/composite

# compose v1
mvn -Drepo.source=${ROOT_DIR}/target/site-v1-all -Drepo.dest=${ROOT_DIR}/target/repo-v1 prepare-package

# compose v2
mvn -Drepo.source=${ROOT_DIR}/target/site-v1-all -Drepo.dest=${ROOT_DIR}/target/repo-v2 prepare-package
mvn -Drepo.source=${ROOT_DIR}/target/site-v2-all -Drepo.dest=${ROOT_DIR}/target/repo-v2 prepare-package

# compose v3
mvn -Drepo.source=${ROOT_DIR}/target/site-v1-all -Drepo.dest=${ROOT_DIR}/target/repo-v3 prepare-package
mvn -Drepo.source=${ROOT_DIR}/target/site-v2-all -Drepo.dest=${ROOT_DIR}/target/repo-v3 prepare-package
mvn -Drepo.source=${ROOT_DIR}/target/site-v3-nos2 -Drepo.dest=${ROOT_DIR}/target/repo-v3 prepare-package

