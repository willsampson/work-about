# == Schema Information
#
# Table name: spots
#
#  id         :integer          not null, primary key
#  address    :string
#  hours      :time
#  photo      :string
#  traffic    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#
class Spot < ApplicationRecord

  has_many(:libraries, { :class_name => "Library", :foreign_key => "spot_id", :dependent => :destroy })
  has_many(:spot_offerings, { :class_name => "SpotOffering", :foreign_key => "spot_id", :dependent => :destroy })
  has_many(:spot_types, { :class_name => "SpotType", :foreign_key => "spot_id", :dependent => :destroy })
  has_many(:reviews, { :class_name => "Review", :foreign_key => "spot_id", :dependent => :destroy })
  belongs_to(:region, { :required => true, :class_name => "Region", :foreign_key => "region_id" })
  has_many(:categories, { :through => :spot_types, :source => :category })
  has_many(:amenities, { :through => :spot_offerings, :source => :amenity })
end
