class AddAgeAndPaToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :political_affiliation, :string, nill: false
    add_column :users, :age, :integer, null: false
    add_index :users, :political_affiliation
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
