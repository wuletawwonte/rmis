# frozen_string_literal: true

class AddSexToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sex, :string
  end
end
