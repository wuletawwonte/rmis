# frozen_string_literal: true

def create_research_calls
  5.times do
    paragraphs = rand(3..5).times.map { Faker::Lorem.paragraph(sentence_count: 8, random_sentences_to_add: 3) }
    rc = Call.create(
      title: Faker::Lorem.sentence,
      published: true,
      deadline: Faker::Date.forward(days: 30),
      user: @admin
    )
    ActionText::RichText.create(record_type: "Call", body: paragraphs.join("<br><br>"), record: rc, name: "content")
  end
end

create_research_calls
puts "5 research calls created"
