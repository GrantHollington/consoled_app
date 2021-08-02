class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :type
      t.string :condition
      t.string :picture
      t.references :buyer, foreign_key: true
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
