class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.belongs_to :family
      t.belongs_to :item
      t.string :description
      t.float :value
      t.date :date

      t.timestamps
    end
  end
end
