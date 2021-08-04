class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :listings, :type, :product
  end
end
