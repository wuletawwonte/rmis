class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :phone_number
      t.string :id_number
      t.references :academic_rank, null: true, foreign_key: true
      t.text :about
      t.string :prefix
      t.references :faculty, null: true, foreign_key: true

      t.timestamps
    end
  end
end
