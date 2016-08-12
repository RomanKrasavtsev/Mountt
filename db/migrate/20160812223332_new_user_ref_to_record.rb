class NewUserRefToRecord < ActiveRecord::Migration[5.0]
  def change
    add_reference :records, :user, index: true, foreign_key: true
  end
end
