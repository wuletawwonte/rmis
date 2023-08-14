# frozen_string_literal: true

class AddIndexToCalls < ActiveRecord::Migration[7.0]
  def change
    add_column :calls, :code, :string
    add_index :calls, :code, unique: true
  end
end
