# frozen_string_literal: true

class AddResearchCenterToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :research_center, null: true, foreign_key: true
  end
end
