class CreateResearchTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :research_types do |t|
      t.string :name
      t.integer :allowed_per_year
      t.boolean :theme_based
      t.string :fund
      t.string :gender

      t.timestamps
    end
    add_index :research_types, :name, unique: true
  end
end
