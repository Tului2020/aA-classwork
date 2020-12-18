# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  email                 :string           not null
#  username              :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  political_affiliation :string
#  age                   :integer          not null
#

class User < ApplicationRecord

    validates :username, :email, presence: true, uniqueness: true
    validates :age, :political_affiliation, presence: true

    has_many :chirps,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Chirp #symbol or string


    has_many :likes,
        primary_key: :id,
        foreign_key: :chirp_id,
        class_name: :Like

    has_many :liked_chirps, #find liked chirps
        through: :likes,
        source: :chirp
    end
