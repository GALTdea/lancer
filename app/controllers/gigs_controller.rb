class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :update, :delete]
  before_action :authenticate_user!, except: [:index, :show]

  def index

  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = current_user.gigs.build(gig_params)

    if @gig.save
      redirect_to @gig, notice: "Job created successfully"
    else
      render :new
    end
  end

  def show

  end

  private

    def gig_params
      params.require(:gig).permit(:name, :description, :budget, :location, :open, :awarded_proposal, :category_id, :user_id)
    end

    def set_gig
      @gig = Gig.find(params[:id])
    end
end
