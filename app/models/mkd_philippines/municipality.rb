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
  class Municipality < Philippine
    belongs_to :province, class_name: 'Province', foreign_key: 'parent_id', optional: true
    has_many :barangays, class_name: 'Barangay', foreign_key: 'parent_id', dependent: :restrict_with_exception
  end
end
  
