# frozen_string_literal: true

class AddSexAndRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sex, :integer, default: 0
    add_column :users, :role, :string, default: "researcher"
  end
end
