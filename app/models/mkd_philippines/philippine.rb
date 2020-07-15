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
  class Philippine < ApplicationRecord
    self.primary_key = 'code'

    has_many :regions, class_name: 'Region', foreign_key: 'parent_id', dependent: :restrict_with_exception
    has_many :provinces, through: :regions, class_name: 'Province', dependent: :restrict_with_exception
    has_many :cities, through: :provinces, class_name: 'City', dependent: :restrict_with_exception
    has_many :municipalities, through: :provinces, class_name: 'Municipality', dependent: :restrict_with_exception
    has_many :barangays, through: :municipalities, class_name: 'Barangay', dependent: :restrict_with_exception

    validates :code, :name, :geographic_level, presence: true
    enum geographic_level: {
      Nat: 'National',
      Reg: 'Region',
      Prov: 'Province',
      City: 'City',
      Mun: 'Municipality',
      Bgy: 'Barangay'
    }
  end
end
