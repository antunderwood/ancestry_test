# == Schema Information
#
# Table name: people
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Person < ActiveRecord::Base
  has_many :groups, :through => :memberships
  has_many :memberships,  :foreign_key => "member_id", :dependent  => :destroy
end
