class CreateChirps < ActiveRecord::Migration[6.1]
  def change
    create_table :chirps do |t|
      t.text :body, null: false
      t.integer :author_id, null: false #foreign key that will be a user
      t.timestamps
    end

    add_index :chirps, :author_id # no need to make it unique, which means that each user gets only one chirp
  end
end
