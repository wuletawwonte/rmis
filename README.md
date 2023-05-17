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

![FireShot Capture 011 - RMIS-Research Management Information System - localhost](https://user-images.githubusercontent.com/12524453/205876961-58987ab6-f9f7-4891-b8e9-5a471c42cc7a.png)

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
