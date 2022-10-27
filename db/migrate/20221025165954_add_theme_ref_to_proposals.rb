class AddThemeRefToProposals < ActiveRecord::Migration[7.0]
  def change
    add_reference :proposals, :theme, null: false, foreign_key: true
  end
end