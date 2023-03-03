# == Schema Information
#
# Table name: spot_offerings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amenity_id :integer
#  spot_id    :integer
#
class SpotOffering < ApplicationRecord
  belongs_to(:spot, { :required => true, :class_name => "Spot", :foreign_key => "spot_id" })
  belongs_to(:amenity, { :required => true, :class_name => "Amenity", :foreign_key => "amenity_id" })
end
