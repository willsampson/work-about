# == Schema Information
#
# Table name: libraries
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  spot_id    :integer
#  user_id    :integer
#
class Library < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:spot, { :required => true, :class_name => "Spot", :foreign_key => "spot_id" })
end
