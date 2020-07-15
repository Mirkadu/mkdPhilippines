module MkdPhilippines
  class RegionsSerializer
    include FastJsonapi::ObjectSerializer
    attributes :parent_id, :type, :code, :name, :geographic_level, :city_class, :income_classification, :rural_urban

    has_many :provinces, serializer: MkdPhilippines::ProvincesSerializer
  end
end
