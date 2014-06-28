class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy, :evolve]

  def index
      @tadpoles = Tadpole.all
  end
  
  def new
     @frog = Frog.find(params[:frog_id])
      @tadpole = Tadpole.new
  end

  def create
    @tadpole = Tadpole.new(tadpole_params)
    if @tadpole.save 
      redirect_to action: 'index'
    else
      redirect_to action: "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @tadpole.update(params[:tadpole])
    redirect_to action: 'index'
  end

  def destroy
    @tadpole.destroy
     redirect_to action: 'index'
  end

  def evolve
      @frog = Frog.new(name: @tadpole.name,color: @tadpole.color, pond: @tadpole.frog.pond)
      if @frog.save 
        @tadpole.destroy
        redirect_to action: 'index'
      else
       redirect_to action: 'edit'
      end
  end
end

private
    
    def set_tadpole
      @tadpole = Tadpole.find(params[:id])
    end

   def tadpole_params
      params.require(:tadpole).permit(:name, :color, :frog_id)
  end