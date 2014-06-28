class PondsController < ApplicationController
      before_action :set_pond, only: [:show, :edit, :update, :destroy]

    def index
        @ponds = Pond.all
    end
    
    def create
        @pond = Pond.create(pond_params)
        redirect_to action: "index"
    end

    def new
      @pond = Pond.new
    end

    def show
    end

    def edit
    end

    def update
        @pond.update(pond_params)
        redirect_to action: "index"
    end

    def destroy
      @pond.destroy
      redirect_to action: "index"
    end
end

private
    
    def set_pond
      @pond = Pond.find(params[:id])
    end

  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end