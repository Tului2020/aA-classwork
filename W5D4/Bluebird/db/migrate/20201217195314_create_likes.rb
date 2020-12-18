class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.integer :chirp_id, null: false

      t.timestamps  #rails g model Like gave us this
    end

    add_index :likes, :liker_id
    # add_index :likes, :chirp_id
    add_index :likes, [:chirp_id, :liker_id], unique: true
  end
end
