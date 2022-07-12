# Simile

1. clone this repo

2. add `settings_private.py` configuration file for backend app in root dir

3. run `./compose.sh` (only for Linux, for Windows more instructions should be added: cloning the repositories of FE and BE (itosos and simile services in the compose))

4. In order to use a development setup run:
    ```
    docker-compose -f docker-compose-dev.yml up
    ```
    To create and env for development (check the `docker-compose-dev.yml` for specifications) and add -d at the end of the command if you prefere detached mode.

5. When you finished the development you can put the env to sleep with:
    ```
    docker-compose down -v
    ```