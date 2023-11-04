# frozen_string_literal: true

academic_ranks = YAML.load_file(Rails.root.join("db", "seeds", "academic_ranks.yml"))

def create_academic_ranks(ac)
  ac.each do |item|
    AcademicRank.create(name: item)
  end
end

create_academic_ranks(academic_ranks)
puts "Created #{academic_ranks.count} academic ranks"
