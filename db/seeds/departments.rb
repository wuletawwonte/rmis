departments = YAML.load_file(Rails.root.join("db", "seeds", "departments.yml"))

def create_departments(departments)
  departments.each do |name|
    Department.create(
      name: name
    )
  end
end

create_departments departments
puts "Created #{departments.count} departments"
