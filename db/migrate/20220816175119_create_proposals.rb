# frozen_string_literal: true

class CreateProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :proposals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :attachement
      t.string :theme
      t.string :status

      t.timestamps
    end
  end
end
