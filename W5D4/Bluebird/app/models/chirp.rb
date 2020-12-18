# == Schema Information
#
# Table name: chirps
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chirp < ApplicationRecord
    validates :body, presence: true, length: { maximum: 140}
    # validates :author_id, presence: true # do not validate the presence of a foreign key if belongs_to exists
    # validates :body_too_long


    # def body_too_long
    #     if body && body.length > 140
    #         errors[:body] << 'TOO LONG!'
    #     end
    # end

    belongs_to :author,             # nameing the association bananable, but be semantic
        primary_key: :id,           # this is always the case
        foreign_key: :author_id,    # column_name
        class_name: :User           # the model it is associated with
    # auto valudates presence of foreign_key
    # belongs_to(:author, {primary_key: :id, foreign_key: :author_id, class_name: :User})

    has_many :likes,
        primary_key: :id,
        foreign_key: :chirp_id,
        class_name: :Like

    has_many :likers,
        through: :likes,
        source: :liker

end
