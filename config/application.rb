# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rmis
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Set rails active job to use sidekiq as an adapter
    config.active_job.queue_adapter = :sidekiq

    initializer "app_assets", after: "importmap.assets" do
      Rails.application.config.assets.paths << Rails.root.join("app") # for component sidecar js
    end

    # Sweep importmap cache for components
    config.importmap.cache_sweepers << Rails.root.join("app/components")

    # Populate system_modules table with data from YAML file
    # config.after_initialize do
      # The code to run the Rake task that loads data from the YAML file and populate the database.
      # Rails.application.load_tasks
      # Rake::Task["system_module:populate"].invoke
    # end
  end
end
