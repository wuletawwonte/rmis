# frozen_string_literal: true

class AddColorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :color, :string
  end
end
