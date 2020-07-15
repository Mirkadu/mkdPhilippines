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
  class Region < Philippine
    belongs_to :philippine, foreign_key: 'parent_id', optional: true
    has_many :provinces, class_name: 'Province', foreign_key: 'parent_id', dependent: :restrict_with_exception
    has_many :municipalities, through: :provinces, class_name: 'Municipality', dependent: :restrict_with_exception
    has_many :barangays, through: :municipalities, class_name: 'Barangay', dependent: :restrict_with_exception
  end
end
