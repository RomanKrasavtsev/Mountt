class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.belongs_to :family
      t.belongs_to :item
      t.float :value

      t.timestamps
    end
  end
end
