# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:bookmark, { :class_name => "Library", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:reviews, { :class_name => "Review", :foreign_key => "user_id", :dependent => :destroy })
  
end
