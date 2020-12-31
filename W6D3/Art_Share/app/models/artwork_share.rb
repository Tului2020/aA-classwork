# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User
  
    
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true

end

#Then add associations connecting an ArtworkShare to both an Artwork and a User (name this association viewer). 
# Add a through association shared_viewers on Artwork. Artwork#shared_viewers will return the set of users with 
# whom an artwork has been shared.

#Add a through association from shared_artworks on User. User#shared_artworks will return the set of artworks 
# that have been shared with that user (not the set of artworks that a user has shared with others).




# We're going to continue building on the API we built in the first routes project. Our goal is to build an application to store, 
# share, and comment on artwork, as well as search for users.

# Each user has a set of artworks that they own/control. These artworks can also be shared with other users. An artwork that has 
# been shared with one or more other users will be visible to those users, but the artwork still 'belongs to' the original user.

# Although we will maintain this conceptual distinction between a user's own artworks vs. the artworks that have been shared with 
# that user, we will eventually write an index method that will combine both types of a user's viewable artworks together so that we 
# can see any art made by or shared with that user.
