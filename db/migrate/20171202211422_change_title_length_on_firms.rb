class ChangeTitleLengthOnFirms < ActiveRecord::Migration[5.1]
  def up
    change_column :firms, :title, :string, limit: 100
  end

  def down
    change_column :firms, :title, :string
  end
end
