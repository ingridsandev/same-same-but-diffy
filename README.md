# same-same-but-diffy
Using Goreplay and Diffy to demonstrate less explored methods of testing our apps.

---

**Goreplay** is used to capture production traffic and replaying live http traffic into an early stage of our development process. This way we can "productionize our tests" and assert that everything that matters still working as expected.

In this repository, you will find a sample API and all scripts needed to locally reprocude goreplay in production and development environments. 

**Requirements:**
 - Install Docker > https://docs.docker.com/get-docker/
 - We are gonna use AWS S3 to store our production traffic, so you will need to authenticate and add your credentials on cred.env file also create a s3 bucket for the destination of your requests.

Lets get started :) 
The following script will build production API and Goreplay images and spin up a docker compose with API and Goreplay containerers.

> sh ops/goreplay/composes/cloud-scenario-prod/run.sh

You will see both containers up and running locally ( happy days 🥳 ) and once you start hitting the api that listen to port 8080 you will see traffic comming into prod environment, these request should now be sitting on your S3 bucket. 

> curl http://localhost:8080/Hackathon

![prod docker-compose up and running](https://github.com/ingridsandev/same-same-but-diffy/blob/main/doc-images/containers-up-and-running-prod.png)

so now, lets use these requests stored on s3 to replay it in an early stage of our development process. 

The following script will build development API and Goreplay images and spin up a docker compose with API and Goreplay containerers.

> sh ops/goreplay/composes/cloud-scenario-dev/run.sh

Once both containers started, you will see immediately that dev container is being hit by the file replay from S3.

![dev docker-compose up and running](https://github.com/ingridsandev/same-same-but-diffy/blob/main/doc-images/containers-up-and-running-dev.png)