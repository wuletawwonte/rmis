# frozen_string_literal: true

class AddAbstractToProposal < ActiveRecord::Migration[7.0]
  def change
    add_column :proposals, :abstract, :text
  end
end
