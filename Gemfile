# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "bootsnap", require: false
gem "devise"
gem "faker"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.5"
gem "puma", "~> 6.4"
gem "rails", "~> 7.1.2"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"

  gem "annotate"
  gem "erb_lint", require: false
  gem "standard", "~> 1.32", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "cancancan"
gem "chartkick"
gem "country_select", "~> 8.0"
gem "groupdate"
gem "image_processing", ">= 1.2"
gem "kaminari"
gem "rack-cors"
gem "sidekiq"
gem "simple_form"
gem "simple_form-tailwind"

gem "dry-initializer", "~> 3.1", ">= 3.1.1"
gem "view_component"

# Administrate related gems
gem "administrate", "~> 0.19.0"
gem "administrate-field-active_storage", "~> 0.4.2"

gem "inline_svg", "~> 1.9"

gem "flipper", "~> 1.0"
