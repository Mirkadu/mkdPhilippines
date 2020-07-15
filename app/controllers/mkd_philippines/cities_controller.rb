require_dependency "mkd_philippines/application_controller"

module MkdPhilippines
  class CitiesController < ApplicationController
    def index
      cities = MkdPhilippines::City.all
      render json: MkdPhilippines::CitiessSerializer.new(cities)
    end

    def show
      city = MkdPhilippines::City.find params[:id]
      render json: MkdPhilippines::CitiesSerializer.new(city, include: ['barangays'])
    end
  end
end
