# frozen_string_literal: true

def create_research_types
  3.times do
    ResearchType.create(
      name: Faker::Lorem.sentence,
      call_based: [true, false].sample,
      max_budget: Faker::Number.between(from: 1000, to: 100_000),
      gender: Faker::Number.between(from: 0, to: 2),
      fund_source: [0, 1].sample,
      min_researcher: Faker::Number.between(from: 2, to: 10),
      max_duration: Faker::Number.between(from: 1, to: 6),
      possible_extension: Faker::Number.between(from: 0, to: 1)
    )
  end
end

create_research_types
puts 'Created 3 research types'
