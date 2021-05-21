# == Schema Information
#
# Table name: spots
#
#  id            :integer          not null, primary key
#  climate       :string
#  cross_country :boolean
#  downhill      :boolean
#  fall          :boolean
#  geography     :string
#  location      :string
#  spring        :boolean
#  summer        :boolean
#  winter        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Spot < ApplicationRecord
  has_many(:trails, { :class_name => "Trail", :foreign_key => "spot_id", :dependent => :destroy })
  has_many(:photos, { :class_name => "Photo", :foreign_key => "spot_id", :dependent => :destroy })
end
