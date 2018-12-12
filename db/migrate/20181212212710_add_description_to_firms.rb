class AddDescriptionToFirms < ActiveRecord::Migration[5.2]
  def change
    add_column :firms, :drescription, :string
  end
end
