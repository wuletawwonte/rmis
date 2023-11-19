namespace :system_module do
  task :populate => :environment do
    system_modules = YAML.load_file("#{Rails.root}/config/modules.yml")

    system_modules.each do |system_module|
      SystemModule.find_or_create_by(key: system_module["key"]) do |sm|
        sm.name = system_module["name"]
        sm.description = system_module["description"]
      end
    end

    puts "System Modules table populated"
  end
end
