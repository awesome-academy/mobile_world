class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :city
      t.string :district
      t.string :address

      t.timestamps
    end
  end
end
