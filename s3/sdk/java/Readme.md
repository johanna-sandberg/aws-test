# Java setup

## Create a new Maven project

```sh
mvn archetype:generate \
-DgroupId=com.mycompany.app \
-DartifactId=my-app \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DarchetypeVersion=1.5 \
-DinteractiveMode=false
```

## Create a new Maven project with AWS

```sh
mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda -Dservice=s3 -Dregion=EU_NORTH_1 \
 -DarchetypeVersion=2.32.28 \
 -DgroupId=com.example.myapp \
 -DartifactId=myapp
```
