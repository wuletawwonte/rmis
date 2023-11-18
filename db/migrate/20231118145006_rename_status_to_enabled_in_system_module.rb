class RenameStatusToEnabledInSystemModule < ActiveRecord::Migration[7.1]
  def change
    rename_column :system_modules, :status, :enabled
  end
end
