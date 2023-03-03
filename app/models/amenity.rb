# == Schema Information
#
# Table name: amenities
#
#  id             :integer          not null, primary key
#  coffee         :boolean
#  food           :boolean
#  noise          :string
#  outlets        :string
#  seating        :string
#  transit_access :string
#  wifi           :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  spot_id        :integer
#
class Amenity < ApplicationRecord
  has_many(:spot_offerings, { :class_name => "SpotOffering", :foreign_key => "amenity_id", :dependent => :destroy })
  has_many(:offered_at, { :through => :spot_offerings, :source => :spot })
end
