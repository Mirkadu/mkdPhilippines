class CreateMkdPhilippinesPhilippines < ActiveRecord::Migration[6.0]
  def change
    create_table :mkd_philippines_philippines, id: false do |t|
      t.bigint :parent_id, null: true
      t.string :type
      t.bigint :code, primary_key: true, null: false
      t.string :name, null: false
      t.string :geographic_level, null: false
      t.string :city_class
      t.string :income_classification
      t.string :rural_urban
      t.index :code

      t.timestamps
    end
  end
end
