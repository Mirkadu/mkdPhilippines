# == Schema Information
#
# Table name: mkd_philippines_philippines
#
#  parent_id             :bigint
#  type                  :string
#  code                  :integer          not null, primary key
#  name                  :string           not null
#  geographic_level      :string           not null
#  city_class            :string
#  income_classification :string
#  rural_urban           :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
module MkdPhilippines
  class  Barangay < Philippine
    belongs_to :municipality, class_name: 'Municipality', foreign_key: 'parent_id', optional: true
    belongs_to :city, class_name: 'City', foreign_key: 'parent_id', optional: true
  end
end
