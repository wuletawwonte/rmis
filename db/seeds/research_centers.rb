# frozen_string_literal: true

def create_research_centers
  all_research_centers = YAML.load_file(Rails.root.join('db', 'seeds', 'research_centers.yml'))
  all_research_centers.sample(3).each do |item|
    person = SeedsHelper.random_person

    research_center = ResearchCenter.create(
      name: item
    )
    research_center.build_user(
      first_name: person.first_name,
      middle_name: person.middle_name,
      last_name: person.last_name,
      email: person.email,
      password: '123456',
      sex: person.gender,
      role: 'research_coordinator'
    )
    research_center.save
  end
end

create_research_centers
puts 'Created 3 research centers with associated coordinator accounts for each'
