#!/bin/bash -eu

mvn archetype:create-from-project
cd target/generated-sources/archetype
# Can we filter this better with the arhcetype plugin?
rm -rf .eclipse .classpath target src/main/resources/arechetype-resources/bin
cat src/main/resources/archetype-resources/pom.xml | sed 's/<mainClass>no\.f12/<mainClass>\$\{groupId\}/g' > src/main/resources/archetype-resources/pom.xml
mvn install

echo ""
echo "Archetype installed!"
echo ""
echo "Use with:"
echo "  mvn archetype:generate -DgroupId=myorg -DartifactId=myapp -Dversion=1.0-SNAPSHOT -DarchetypeGroupId=no.f12 -DarchetypeArtifactId=really-executable-util-archetype"
echo " "