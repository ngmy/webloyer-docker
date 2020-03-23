# Webloyer Docker

Docker image for [Webloyer](https://github.com/ngmy/webloyer).

## Included Containers

* Web server with nginx
* Application server for the Webloyer web UI with PHP 7.2 and PHP-FPM
* Job scheduler server for the Webloyer scheduled job with PHP 7.2
* Queue worker server for the Webloyer queued job with PHP 7.2
* Database server with MySQL 5.7

## Requirements

* Docker
* Docker Compose

## Installation

1. Download the source code by using the Git `clone` command:
   ```
   git clone https://github.com/ngmy/webloyer-docker.git
   ```
2. Copy the `.env.example` file to a `.env` file by running the following command:
   ```
   cp .env.example .env
   ```
3. Open the `.env` file and set environment variables.
4. Start Webloyer Docker with the Docker Compose `up` command:
   ```
   docker-compose up -d
   ```
5. Go to http://localhost and login with the e-mail address `admin@example.com` and the password `admin`.

## License

Webloyer Docker is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
