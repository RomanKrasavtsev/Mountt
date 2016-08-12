class AddUserRefToRecord < ActiveRecord::Migration[5.0]
  def change
    add_reference :records, :users, index: true, foreign_key: true
  end
end
