# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
artist1 = User.create(username: 'TestUser1')
artist2 = User.create(username: 'TestUser2')
artist3 = User.create(username: 'TestUser3')

Artwork.destroy_all
artworks1 = Artwork.create(title: 'Title1', image_url: 'www.image1.com', artist_id: artist1.id)
artworks2 = Artwork.create(title: 'Title2', image_url: 'www.image2.com', artist_id: artist1.id)
artworks3 = Artwork.create(title: 'Title3', image_url: 'www.image3.com', artist_id: artist2.id)
artworks4 = Artwork.create(title: 'Title4', image_url: 'www.image4.com', artist_id: artist2.id)

ArtworkShare.destroy_all
artwork_shares1 = ArtworkShare.create(artwork_id: artworks1.id, viewer_id: artist2.id)
artwork_shares2 = ArtworkShare.create(artwork_id: artworks2.id, viewer_id: artist2.id)
artwork_shares3 = ArtworkShare.create(artwork_id: artworks3.id, viewer_id: artist1.id)
artwork_shares4 = ArtworkShare.create(artwork_id: artworks4.id, viewer_id: artist1.id)
artwork_shares5 = ArtworkShare.create(artwork_id: artworks1.id, viewer_id: artist3.id)






# create_table "artwork_shares", force: :cascade do |t|
#   t.integer "artwork_id", null: false
#   t.integer "viewer_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["artwork_id"], name: "index_artwork_shares_on_artwork_id"
#   t.index ["viewer_id"], name: "index_artwork_shares_on_viewer_id"
# end

# create_table "artworks", force: :cascade do |t|
#   t.string "title", null: false
#   t.integer "artist_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "image_url", null: false
#   t.index ["artist_id"], name: "index_artworks_on_artist_id"
# end

# create_table "users", force: :cascade do |t|
#   t.string "username", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end



