class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :long_name
      t.string :city
      t.string :distance
      t.string :phone

      t.timestamps
    end
  end
end
