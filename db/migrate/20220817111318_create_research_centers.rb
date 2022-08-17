class CreateResearchCenters < ActiveRecord::Migration[7.0]
  def change
    create_table :research_centers do |t|
      t.string :name

      t.timestamps
    end
  end
end
