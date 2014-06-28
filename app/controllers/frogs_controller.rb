class FrogsController < ApplicationController
    before_action :set_frog, only: [:show, :edit, :update, :destroy]

  def index
      @frogs = Frog.all
  end

  def create
    @frog = Frog.create(frog_params)
      redirect_to action: "index"
    end

    def new
      @frog = Frog.new
      @ponds = Pond.all
    end

  def show
    # binding.pry
  end

  def edit
    @ponds = Pond.all
  end

  def update
    @frog.update(frog_params)
    redirect_to action: "index"
  end

  def destroy
    @frog.destroy
    redirect_to action: "index"
  end

  # get '/frogs/:id/tadpoles/new' do
  #   # Write the code to find the correct frog
  #   # and redirect to new tadpole form view
  #   @frog = Frog.find(params[:id])
  #   erb :"tadpoles/new"
  #     end
end

private

    def set_frog
      @frog = Frog.find(params[:id])
    end

    def frog_params
      params.require(:frog).permit(:name, :color, :pond_id)
    end
