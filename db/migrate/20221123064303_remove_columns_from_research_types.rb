class RemoveColumnsFromResearchTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :research_types, :allowed_per_year, :integer
    remove_column :research_types, :theme_based, :boolean
    remove_column :research_types, :fund, :string
    remove_column :research_types, :gender, :string
  end
end
