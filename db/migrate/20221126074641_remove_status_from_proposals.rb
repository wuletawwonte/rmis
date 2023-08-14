# frozen_string_literal: true

class RemoveStatusFromProposals < ActiveRecord::Migration[7.0]
  def change
    remove_column :proposals, :status, :string
  end
end
