class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status, default: 'pending'
      t.datetime :due_date, index: true

      t.timestamps
    end
  end
end
