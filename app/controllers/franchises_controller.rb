class FranchisesController < ApplicationController
  def index
    @franchises = Franchise.all
  end

  def create
    @franchise = Franchise.new(franchise_params)

    if @franchise.save
      redirect_to franchises_path
    else
      render 'new'
    end
  end

  def destroy
    @franchise =  Franchise.find(params[:id])
    @franchise.destroy

    flash[:notice] = 'Post Deleted.'
    redirect_to root_path
  end

  private

  def franchise_params
    params.require(:franchise).permit(:name)
  end
end
