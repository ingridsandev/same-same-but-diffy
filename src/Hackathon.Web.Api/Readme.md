## Start the APIs and diffy server(Docker required)
In your terminal, run `sh ops/diffy/run.sh` 

This will launch a container hosting 4 apps.
- diffy server
- 3 APis

The APIs are meant to simulate a production and candidate environment. The production API is actually 2 APIs. (primary & secondary). The diffy server uses these 2 APIs to reduce the amount of noise (data that is different in the response from each API eg time).

## Diffy server
Once you run the above script, you can browse to `http://localhost:5010`.

This is where you will see your traffic and can see the differences in the responses that are returned from each of the APIs.

## Send traffic
In your terminal, run `sh ops/diffy/send-traffic.sh`

This will simulate some requests to the APIs. these request go through a proxy that diffy sets up. the proxy then sends the requests to each API and detects the differences in the response.
Some of the requests here are meant to show differences on the diffy server.

## The API
The API is very simple. All it does is
- Excepts a payload
- Checks if the API is in candidate mode
- If it is, it tries to format the `DateOfBirth` prop into a valid date time format.

## External Resources
[Diffy Repo](https://github.com/twitter-archive/diffy)
