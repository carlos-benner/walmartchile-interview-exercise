# walmartchile-interview-exercise

This repository requires `git`, `docker` and `docker-compose` installed in your machine.
You also need to be part of the docker group or run this with `sudo`

## How to run this exercise:

1. Clone this repository to your machine.
2. Run `$ make cb-set-containers`. This command will:

    1. Get the 3 projects required to run the solution.
        - DB: https://github.com/walmartdigital/products-db
        - API: https://github.com/carlos-benner/walmartchile-interview-exercise-nodejs-api
        - WEB: https://github.com/carlos-benner/walmartchile-interview-exercise-front
    2. Copy Dockerfile to the DB repository.
    3. Deploy each applications to their own Docker container and install all required node packages.
    4. Import Promotions DB to the MongoDB.
    5. Run the tests for the API application.
    6. Forward the web application to your machine port `80`

3. Visit http://localhost:80
4. Use the search bar to find products.

## Removing the exercise

Just run `$ make cb-clear-containers` to

-   Remove all repositories downloaded.
-   Stop all docker containers created.
-   Remove all docker containers created.
-   Remove all docker images created.
