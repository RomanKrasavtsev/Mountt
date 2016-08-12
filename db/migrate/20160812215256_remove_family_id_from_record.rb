class RemoveFamilyIdFromRecord < ActiveRecord::Migration[5.0]
  def change
    remove_column :records, :family_id
  end
end
