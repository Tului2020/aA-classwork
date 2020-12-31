class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, :image_url, null: false
      t.timestamps
    end

    add_index :artworks, :artist_id
    # Ensure a single user cannot have two artworks with the same title
  end
end
