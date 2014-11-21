class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :population
      t.integer :elevation
      t.string :state

      t.timestamps
    end
  end
end
