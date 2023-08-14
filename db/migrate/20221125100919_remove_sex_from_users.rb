# frozen_string_literal: true

class RemoveSexFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :sex, :string
  end
end
