# frozen_string_literal: true

class RemoveStatusFromMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :status, :string
  end
end
