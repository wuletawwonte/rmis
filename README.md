# AMU-RMIS - Arba Minch University Resarch Management Information System

> A system being developed for Arba Minch University that automates the research business process from `Call for paper` to `Publication`.

## Built With

- Ruby on Rails
- Ruby
- Rubocop
- [Windmill](https://windmillui.com/) template used in the ui.
- [Alpinejs](https://alpinejs.dev/)

## Live Demo

[live link](https://amu-rmis.herokuapp.com/)

## Getting Started

To get a local copy follow these simple example steps.

- Make sure you have Postgres and Ruby installed.
- Open the terminal window and clone the repository using this command: git clone https://github.com/wuletawwonte/rmis.git
- Open the repo by typing : cd rmis
- Install the project's dependencies by running this command: bundle install
- Run `rails db:create` to create the database.
- Run rails `rails db:schema:load` to create the relations in the database for the project based on the schema file inside the `db` folder.
- Run rails server or rails s to start the application on local server.
- To test the project, run rspec in your terminal
- To test mailer use `mailcatcher` gem, It's not in the Gemfile but I used it to catch mails. Here are the instructions of using it
  - Run `gem install mailcatcher`
  - Run `mailcatcher` to start the mail catcher server
  - Go to `http://127.0.0.1:1080`
  - Send mail through smtp://127.0.0.1:1025

### Configuring Rails

Create an .env file with the minimum ENV variables needed for booting Rails:

```bash
cp .env.example .env
```

You can edit the configruation options or go with the default setup. 

## Sidekiq setup

[Active jobs](https://guides.rubyonrails.org/active_job_basics.html) of Rails is used to handle declaring and running jobs asynchronously. The adapter used for background jobs in the project is `Sidekiq`. Since `Sidekiq` uses [redis](https://redis.io/) to store queue of background jobs, redis server must be installed for sidekiq to work.

For ubuntu users run this command to install redis server

```bash
sudo apt install redis-server
```

**Sidekiq requires Redis 6.2.0 or greater** so install the appropriate version of Redis.

Once installed, make sure the service is running by executing the command: `sudo systemctl status redis`

Finaly after starting rails server `sidekiq` must run in the background by running this command

```bash
bundle exec sidekiq -q default -q mailers
```

## Web server
This project uses [Puma](https://puma.io/) as a web server for development. The `.env` file is where some of the configuration of the app is written. 

Use [dev-tld-resolver](https://github.com/puma/dev-tld-resolver) to access the application with a custom domain name, because it redirects `.dev` tld to localhost. The default domain name in the development environment is `rmis.dev` but it can be changed to a custom domain name by setting `DEV_DOMAIN_NAME=rmis.dev` in the `.env` file.

**HTTPS (recommended)**

Use [mkcert](https://github.com/FiloSottile/mkcert) to generate and install certificates for local domains: `mkcert rmis.dev "*.rmis.dev" localhost 127.0.0.1`

In `.env`, set:

```
TEST_CERT_KEY=config/ssl/rmis.dev-key.pem
TEST_CERT=config/ssl/rmis.dev.pem
DEV_ENV_HTTPS=1
```

Run `rails s` to start Puma locally. `config/puma.rb` has setting to bind it to 0.0.0.0 when running with `DEV_ENV_HTTPS=1`.
The app does not fully work on a non-standard port. To route every port to 3000, run: `sudo iptables -t nat -A OUTPUT -o lo -p tcp --dport 443 -j REDIRECT --to-port 3000`. Run the same command with `-D` instead of `-A` to disable. This will also be reset when you restart your computer.

## Docker Setup

Before going through these steps please make sure you have [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/) installed in your machine. 

NOTE: these docker setup is for setting up development environment only.

To start working on this project all you have to do is clone the repo locally and navigate to the project root directory. Execute the following command to build and start the docker images based on the configuration provided. 

```bash
docker-compose up
```
Then open http://localhost:3000 or http://127.0.0.1:3000 on your browser. You need to run one more command from your terminal before the app succesfully runs. That is to run the migration of the database. 

```bash
docker-compose run web bin/rails db:migrate
```

## Authors

👤 **Wuletaw Wonte**

- GitHub: [@wuletawwonte](https://github.com/wuletawwonte)
- Twitter: [@wuletaww](https://twitter.com/wuletaww)
- LinkedIn: [LinkedIn](https://linkedin.com/in/wuletaw-wonte)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Windmill](https://windmillui.com/) template used in the ui.
- Hat tip to anyone whose code was used as inspiration

## 📝 License

This project is [MIT](./LICENSE.md) licensed.
