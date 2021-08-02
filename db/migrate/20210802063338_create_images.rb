class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :title
      t.string :description
      t.string :image_path
      t.string :byte_size
      t.references :profile, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
