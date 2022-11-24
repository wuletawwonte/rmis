class RemoveThemeIdFromProposals < ActiveRecord::Migration[7.0]
  def change
    remove_column :proposals, :theme_id, :bigint
  end
end
