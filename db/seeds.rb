# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "seeds_helper"

puts "========== SEEDING ... =========="

User.destroy_all
GlobalSetting.destroy_all
ResearchCenter.destroy_all
Call.destroy_all
ResearchType.destroy_all

def seed(file)
  load Rails.root.join("db", "seeds", "#{file}.rb")
end

seed("admin")
seed("calls")
seed("research_centers")
seed("research_types")
seed("global_settings")
seed("researchers")

puts "========== SEEDING DONE =========="
