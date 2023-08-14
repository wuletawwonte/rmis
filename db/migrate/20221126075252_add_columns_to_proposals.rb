# frozen_string_literal: true

class AddColumnsToProposals < ActiveRecord::Migration[7.0]
  def change
    add_column :proposals, :status, :integer, default: 0
    add_column :proposals, :budget, :integer
    add_reference :proposals, :theme, null: false, foreign_key: true
  end
end
