class AddRoleToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :role, :integer, default: 0
  end
end
