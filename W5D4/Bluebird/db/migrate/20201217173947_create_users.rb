class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      #t.data_type :column_name, options={}
      t.string :email, null: false # db constraints
      t.string :username, null: false
      t.timestamps #create_at, update_at timestamps


    end

      # add_index :table_name, :column_name, options={}
      # index creates a binary search type data structure for this column
      # indexing speeds up lookup time - add to columns you will search by

      add_index :users, :username, unique: true
      add_index :users, :email, unique: true

      # unique trye only works if you add_index
      # rails won't do it if you don't speed up the search time
  end
end
