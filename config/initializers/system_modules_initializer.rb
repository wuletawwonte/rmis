Rails.application.config.after_initialize do
  # Your code here to run the Rake task or load the data from the YAML file
  Rake::Task["system_modules:populate"].invoke
end
