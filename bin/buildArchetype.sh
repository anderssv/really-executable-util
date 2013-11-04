#!/bin/bash -eu

mvn archetype:create-from-project
cd target/generated-sources/archetype
# Can we filter this better with the arhcetype plugin?
rm -rf .eclipse .classpath target bin
sed -i 's/<mainClass>no\.f12/<mainClass>\$\{groupId\}/g' src/main/resources/archetype-resources/pom.xml
mvn install
