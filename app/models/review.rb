# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  photo          :string
#  rating         :string
#  review_content :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  spot_id        :integer
#  user_id        :integer
#
class Review < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:spot, { :required => true, :class_name => "Spot", :foreign_key => "spot_id" })
  
end
