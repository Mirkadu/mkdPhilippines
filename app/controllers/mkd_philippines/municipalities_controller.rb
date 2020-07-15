require_dependency "mkd_philippines/application_controller"

module MkdPhilippines
  class MunicipalitiesController < ApplicationController
    def index
      municipalities = MkdPhilippines::Municipality.all
      render json: MkdPhilippines::MunicipalitiesSerializer.new(municipalities)
    end

    def show
      municipality = MkdPhilippines::Municipality.find params[:id]
      render json: MkdPhilippines::MunicipalitiesSerializer.new(municipality, include: ['barangays'])
    end
  end
end
