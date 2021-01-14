# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :description, :moderator_id, presence: true
    validates :title, presence: true, uniqueness: true

    belongs_to :moderator, 
        foreign_key: :moderator_id,
        class_name: :User


    has_many :posts, 
        class_name: :Post, 
        foreign_key: :sub_id

    # has_many :other_posts,
    #     through: :x,
    #     source: :y
    

end
