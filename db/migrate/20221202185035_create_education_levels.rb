class CreateEducationLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :education_levels do |t|
      t.string :name
      t.integer :order_key

      t.timestamps
    end
    add_index :education_levels, :name, unique: true
  end
end