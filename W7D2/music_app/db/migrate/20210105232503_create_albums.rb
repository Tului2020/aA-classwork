class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.string :record_type, null: false
      t.timestamps
    end
    add_index :albums, :band_id

    # validates :sex, presence: true, inclusion: { in: self.available_genders.keys}
  end
end
