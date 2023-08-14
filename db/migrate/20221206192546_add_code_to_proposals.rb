# frozen_string_literal: true

class AddCodeToProposals < ActiveRecord::Migration[7.0]
  def change
    add_column :proposals, :code, :string
    add_index :proposals, :code, unique: true
  end
end
