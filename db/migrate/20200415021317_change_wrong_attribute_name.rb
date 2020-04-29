class ChangeWrongAttributeName < ActiveRecord::Migration[6.0]
  def change
    remove_column :albums, :data, :datetime
    add_column :albums, :date, :datetime
  end
end
