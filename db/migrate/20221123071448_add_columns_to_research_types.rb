class AddColumnsToResearchTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :research_types, :call_based, :boolean
    add_column :research_types, :max_budget, :integer
    add_column :research_types, :gender, :integer, default: 2
    add_column :research_types, :fund_source, :integer, default: 0
    add_column :research_types, :min_researcher, :integer
    add_column :research_types, :max_duration, :integer
    add_column :research_types, :possible_extension, :integer
  end
end
