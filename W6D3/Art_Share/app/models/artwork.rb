# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_url  :string           not null
#
class Artwork < ApplicationRecord
  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User
  
  has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare
  
  has_many :shared_viewers,
    through: :shares,
    source: :viewer

  has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment

  validates :title, presence: true
  validates :artist_id, presence: true
  validates :image_url, presence: true

  
end

#Then add associations connecting an ArtworkShare to both an Artwork and a User (name this association viewer). 
# Add a through association shared_viewers on Artwork. Artwork#shared_viewers will return the set of users with 
# whom an artwork has been shared.

#Add a through association from shared_artworks on User. User#shared_artworks will return the set of artworks 
# that have been shared with that user (not the set of artworks that a user has shared with others).
