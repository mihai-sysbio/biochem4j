#!/usr/bin/env bash

rm -rf /var/lib/neo4j/data/databases/graph.db
/var/lib/neo4j/bin/neo4j-admin import --nodes /input/nodes/*.csv --relationships /input/rels/*.csv
	
sed -i 's/#dbms.read_only=false/dbms.read_only=true/g' conf/neo4j.conf
sed -i 's/#dbms.connector.http.address/dbms.connector.http.address/g' conf/neo4j.conf