module MkdPhilippines
  class BarangaysSerializer
    include FastJsonapi::ObjectSerializer
    attributes :parent_id, :type, :code, :name, :geographic_level, :city_class, :income_classification, :rural_urban

    attribute :city do |object|
      object&.city&.attributes&.except('updated_at', 'created_at')
    end

    attribute :municipality do |object|
      object&.municipality&.attributes&.except('updated_at', 'created_at')
    end
  end
end
