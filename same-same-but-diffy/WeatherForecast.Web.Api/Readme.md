##Run the APIs *(Docker required)
In this repo there is a file named `run.sh` Running this will set up the APIs using Docker. At this point, please install Docker if you have not already.

##Run the Diffy *(Java v8 required to build the diffy-server-jar)

I downloaded the mac version of Java8 (openJDK8) from here

https://adoptopenjdk.net/?variant=openjdk8&jvmVariant=hotspot.

Once you have java 8 installed, make sure you have your terminal set up to use java 8 and not any other version.

This link helped me with that
https://stackoverflow.com/a/24657630

If this is not set up, you will not be able to run or build the java-server.jar file

Once you have this configured correctly

Clone the diffy repo
```
git clone https://github.com/opendiffy/diffy
```
Go into the diffy folder
```
cd diffy
```
Then run
```
./sbt assembly
```

This will build the diffy server jar file into the directory
`target/scala-{version}`

Some times this wont build because the params passed to the java command fail.
If you open the sbt file, change the java command to this
```text
[ -f ~/.sbtconfig ] && . ~/.sbtconfig
java -ea                          \
  $SBT_OPTS                       \
  $JAVA_OPTS                      \
  -Djava.net.preferIPv4Stack=true \
  -XX:+UseConcMarkSweepGC         \
  -XX:+CMSParallelRemarkEnabled   \
  -XX:+CMSClassUnloadingEnabled   \
  -XX:ReservedCodeCacheSize=128m  \
  -XX:SurvivorRatio=128           \
  -XX:MaxTenuringThreshold=0      \
  -Xss8M                          \
  -Xms512M                        \
  -Xmx2G                          \
  -server                         \
  -jar $sbtjar "$@" --add-opens \
```

Run the diffy server
```text
java -jar diffy-server.jar \
    -candidate=localhost:9992 \
    -master.primary=localhost:9990 \
    -master.secondary=localhost:9991 \
    -responseMode='primary' \
    -service.protocol=http \
    -serviceName=Hackathon-2021 \
    -maxHeaderSize='32.kilobytes' \
    -maxResponseSize='5.megabytes' \
    -proxy.port=:8880 \
    -admin.port=:8881 \
    -http.port=:8888 \
    -rootUrl="localhost:8888" \
    -summary.email="info@diffy.ai" \
    -summary.delay="5"
```

Visit the server at `http://localhost:8888` to view incoming requests

Send requests to `http://localhost:8880`

Here is an example of a request

`curl --header "Canonical-Resource: Weather_Forecast" localhost:8880/WeatherForecast`

Notice `-header "Canonical-Resource: Weather_Forecast"`. The importance of this header is that, this is how diffy will group the requests in the server UI. These headers should match your endpoint names.

