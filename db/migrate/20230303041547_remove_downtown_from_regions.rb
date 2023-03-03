class RemoveDowntownFromRegions < ActiveRecord::Migration[6.0]
  def change
    remove_column :regions, :Downtown
  end
end
