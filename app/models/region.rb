# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  downtown   :string
#  northside  :string
#  southside  :string
#  suburbs    :string
#  westside   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Region < ApplicationRecord
  has_many(:spots, { :class_name => "Spot", :foreign_key => "region_id", :dependent => :destroy })
end
