# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  band_id     :integer          not null
#  title       :string           not null
#  year        :integer          not null
#  record_type :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Album < ApplicationRecord
  validates :band_id, :title, :year, :record_type, presence: true
  validates :record_type, inclusion: { in: ["Live", "Studio"]}

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band,
    dependent: :destroy
  
    # belongs_to :object, class_name: "object", foreign_key: "object_id"

end
