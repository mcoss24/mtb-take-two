# == Schema Information
#
# Table name: trails
#
#  id         :integer          not null, primary key
#  link       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  spot_id    :integer
#
class Trail < ApplicationRecord
  belongs_to(:spot, { :required => false, :class_name => "Spot", :foreign_key => "spot_id" })
end
