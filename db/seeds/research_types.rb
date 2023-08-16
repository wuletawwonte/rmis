# frozen_string_literal: true

def create_research_types
  3.times do
    ResearchType.create(
      name: Faker::Lorem.sentence
    )
  end
end

create_research_types
puts 'Created 3 research types'
