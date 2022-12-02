class CreateAcademicRanks < ActiveRecord::Migration[7.0]
  def change
    create_table :academic_ranks do |t|
      t.string :name
      t.integer :order_key

      t.timestamps
    end
    add_index :academic_ranks, :name, unique: true
  end
end
