# Simile: Development environment setup

1. clone this repo:
    ```sh
    git clone https://github.com/gtergeomatica/simile-containers.git
    ```

2. add `settings_private.py` configuration file for backend app in root dir

3. run `./compose.sh` (only for Linux, for Windows more instructions should be added: cloning the repositories of FE and BE (itosos and simile services in the compose))

4. In order to use a development setup run:
    ```
    docker-compose -f docker-compose-dev.yml up
    ```
    To create an env for development (check the `docker-compose-dev.yml` for specifications) and add -d at the end of the command if you prefere detached mode.

5. When you finished the development you can put the env to sleep with:
    ```
    docker-compose down -v
    ```

## Deploy environment setup

1. In order to use a development setup run:
    ```
    docker-compose -f docker-compose-deploy.yml up
    ```

##

### Build and share single docker containers

#### SIMILE GUI

##### Deployment config setup

Before share for deployment online purposes remember to correctly setup the subsequent
value in the `config.js` file:

```js
const config = {
    istsosProxy: proxyConf, // <- otherwise for development use devProxyConf instead of proxyConf
    ...
```

##### Build the image

```sh
cd simile
docker build -f deploy.Dockerfile .
```

at the end of process it returns somethig like: `Successfully built b0cf2d8dd402`
the final random string is always different and it identify the new built image

##### Tag the new image

```sh
docker tag b0cf2d8dd402 manuelegter/simile-web:latest
```

**WARNING**: PLease remember to update the image id with the correct one you obtained
from previouse step

##### Share the new image

```sh
docker login
docker push manuelegter/simile-web:latest
```

#### ISTSOS Proxy

#### Build the image

```sh
cd istsos
docker build .
```

at the end of process it returns somethig like: `Successfully built b0cf2d8dd402`
the final random string is always different and it identify the new built image

##### Tag the new image

```sh
docker tag b0cf2d8dd402 manuelegter/istsos-proxy:latest
```

**WARNING**: PLease remember to update the image id with the correct one you obtained
from previouse step

##### Share the new image

```sh
docker login
docker push manuelegter/istsos-proxy:latest
```
