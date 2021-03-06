class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :color, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
      t.text :description
      t.references :manufacturer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
