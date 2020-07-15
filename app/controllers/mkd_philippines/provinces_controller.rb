require_dependency "mkd_philippines/application_controller"

module MkdPhilippines
  class ProvincesController < ApplicationController
    def index
      provinces = MkdPhilippines::Province.all
      render json: MkdPhilippines::ProvincesSerializer.new(provinces)
    end

    def show
      province = MkdPhilippines::Province.find params[:id]
      render json: MkdPhilippines::ProvincesSerializer.new(province, include: ['cities', 'municipalities'])
    end
  end
end
