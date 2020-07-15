module MkdPhilippines
  class ProvincesSerializer
    include FastJsonapi::ObjectSerializer
    attributes :parent_id, :type, :code, :name, :geographic_level, :city_class, :income_classification, :rural_urban

    has_many :cities, serializer: MkdPhilippines::CitiesSerializer
    has_many :municipalities, serializer: MkdPhilippines::MunicipalitiesSerializer
  end
end
