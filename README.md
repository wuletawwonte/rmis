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
- Hat tip to anyone whose code was used
- Inspiration

## 📝 License

This project is [MIT](./MIT.md) licensed.
