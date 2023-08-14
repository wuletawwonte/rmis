# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :profile, null: true, foreign_key: true
  end
end
