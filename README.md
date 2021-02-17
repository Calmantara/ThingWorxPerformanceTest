# ThingWorx Performance Test

This is docker container project to do Performance Test on ThingWorx Server using Apache JMeter.
The components are:
- docker
- windowsservercore as based container
- Apache JMeter

## Installation

Before you run this project, please kindly install docker and docker-compose by this following links [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/) if you have not been installed them.

## Running the tests

To run this test, change the docker type to windows container instead of linux container (this is because the test will run on **windowsservercore** container).

Change the configuration inside the **config.json** file
```Bash
{
    "servers":[
        {
            "SERVER_NAME":"Server1",
            "TARGET_HOST":"your server host",
            "TARGET_PORT":"8443",
            "TARGET_APPKEY":"your app key",
            "THREADS":"1",
            "SCHEME":"http"
        },
        {
            "SERVER_NAME":"Server2",
            "TARGET_HOST":"your server host",
            "TARGET_PORT":"443",
            "TARGET_APPKEY":"your app key",
            "THREADS":"1",
            "SCHEME":"https"
        }
    ]
}

```

### running docker-composer

To start services, run using *docker-compose* command

```Bash
#kill all docker container 
sudo docker-compose down

##for the first time run the project
sudo docker-compose up --build

##next time after build
sudo docker-compose up
```

## Authors

* **Calmantara Sumpono Putra**  - [Github](https://github.com/Calmantara)

## Acknowledgments

* Allah SWT
* My Mommy
* All sides that support and inpire me
