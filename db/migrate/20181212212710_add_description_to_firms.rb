class AddDescriptionToFirms < ActiveRecord::Migration[5.2]
  def change
    add_column :firms, :description, :text
  end
end
