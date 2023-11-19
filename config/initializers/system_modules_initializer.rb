Rails.application.config.after_initialize do
  # The code to run the Rake task that loads data from the YAML file and populate the database.
  Rake::Task["system_module:populate"].invoke
end
