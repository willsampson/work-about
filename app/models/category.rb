# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  cafe           :boolean
#  coworking      :boolean
#  hotel          :boolean
#  library        :boolean
#  mixed_use      :boolean
#  outdoor_option :boolean
#  public_space   :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Category < ApplicationRecord

  has_many(:spot_types, { :class_name => "SpotType", :foreign_key => "category_id", :dependent => :destroy })
  has_many(:spots, { :through => :spot_types, :source => :spot })
  
end
