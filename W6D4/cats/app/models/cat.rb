# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  
  @genders = {"M": "Male", 'F': 'Female'}.stringify_keys.freeze
  @colors = ['white', 'black', 'green', 'neon clear'].freeze


  def age 
    (Date.today - birth_date).to_i
  end

  def self.available_colors
    @colors
  end

  def self.available_genders
    @genders
  end


  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: { in: self.available_colors}
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: self.available_genders.keys}
  validates :description, presence: true

end
