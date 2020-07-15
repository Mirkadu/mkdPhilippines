require_dependency "mkd_philippines/application_controller"

module MkdPhilippines
  class NationalsController < ApplicationController
    def index
      national = MkdPhilippines::Philippine.first
      render json: MkdPhilippines::NationalsSerializer.new(national, include: ['regions', 'regions.provinces', 'regions.provinces.municipalities', 'regions.provinces.cities', 'regions.provinces.municipalities.barangays', 'regions.provinces.cities.barangays'])
    end
  end
end
