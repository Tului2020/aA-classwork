# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  liker_id   :integer          not null
#  chirp_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  validates :liker_id, uniqueness: { scope: :chirp_id }
  #be unique in respect to the chirp_id 

  #if we have foreign_keys, we belongs_to it 
  belongs_to :liker,
    primary_key: :id, 
    foreign_key: :liker_id,
    class_name: :User 

  belongs_to :chirp, 
    primary_key: :id, 
    foreign_key: :chirp_id, 
    class_name: :Chirp 

  #belongs_to: all foreign keys comes from the model we are on
end
