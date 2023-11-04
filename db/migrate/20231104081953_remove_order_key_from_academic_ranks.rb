class RemoveOrderKeyFromAcademicRanks < ActiveRecord::Migration[7.1]
  def up
    remove_column :academic_ranks, :order_key
  end

  def down
    add_column :academic_ranks, :order_key
  end
end
