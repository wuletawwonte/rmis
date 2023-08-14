# frozen_string_literal: true

class AddResearchTypeToProposals < ActiveRecord::Migration[7.0]
  def change
    add_reference :proposals, :research_type, null: false, foreign_key: true
  end
end
