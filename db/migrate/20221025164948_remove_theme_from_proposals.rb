# frozen_string_literal: true

class RemoveThemeFromProposals < ActiveRecord::Migration[7.0]
  def change
    remove_column :proposals, :theme, :string
  end
end
