# frozen_string_literal: true

class AddStatusToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :status, :string
  end
end
