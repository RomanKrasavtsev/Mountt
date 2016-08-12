class RemoveUsersIdFromRecord < ActiveRecord::Migration[5.0]
  def change
    remove_column :records, :users_id
  end
end
