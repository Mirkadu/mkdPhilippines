require_dependency "mkd_philippines/application_controller"

module MkdPhilippines
  class RegionsController < ApplicationController
    def index
      regions = MkdPhilippines::Region.all
      render json: MkdPhilippines::RegionsSerializer.new(regions)
    end

    def show
      region = MkdPhilippines::Region.find params[:id]
      render json: MkdPhilippines::RegionsSerializer.new(region, include: ['provinces'])
    end
  end
end
