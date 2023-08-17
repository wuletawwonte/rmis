# frozen_string_literal: true

def create_research_centers
  all_research_centers = YAML.load_file(Rails.root.join('db', 'seeds', 'research_centers.yml'))
  themes = YAML.load_file(Rails.root.join('db', 'seeds', 'themes.yml'))
  all_research_centers.sample(3).each_with_index do |item, index|
    person = SeedsHelper.random_person

    research_center = ResearchCenter.new(
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
    themes[index].each do |theme_item|
      Theme.create(title: theme_item, research_center:, user: research_center.user)
    end
    research_center.save
  end
end

create_research_centers
puts 'Created 3 research centers with associated coordinator accounts for each'
