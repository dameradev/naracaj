class CreateFirms < ActiveRecord::Migration[5.1]
  def change
    create_table :firms do |t|
      t.string :title, null: false

      t.timestamps

      t.index :title, unique: true
    end
  end
end
