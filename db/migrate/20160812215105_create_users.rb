class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.belongs_to :family
      t.string :firstname
      t.string :email     

      t.timestamps
    end
  end
end
