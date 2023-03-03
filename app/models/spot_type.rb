# == Schema Information
#
# Table name: spot_types
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  spot_id     :integer
#
class SpotType < ApplicationRecord
  belongs_to(:category, { :required => true, :class_name => "Category", :foreign_key => "category_id" })
  belongs_to(:spot, { :required => true, :class_name => "Spot", :foreign_key => "spot_id" })
end
