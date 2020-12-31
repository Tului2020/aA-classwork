class CorrectArtworks < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :image_url
    add_column :artworks, :image_url, :string, null: false
  end
end
