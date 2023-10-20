class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.string :weather_description
      t.float :temperature
      t.integer :humidity
      t.integer :pressure
      t.belongs_to :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
