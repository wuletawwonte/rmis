class ResearchCentersController < ApplicationController
  def index
    @research_centers = ResearchCenter.order(:created_at).page params[:page]
  end

  def show; end

  def new
    @research_center = ResearchCenter.new
  end

  def create
    @research_center = ResearchCenter.new(research_center_params)

    if @research_center.save
      redirect_to research_centers_path, notice: 'Successfully added.'
    else
      render 'new'
    end
  end

  def edit; end

  def destroy; end

  private

  def research_center_params
    params.require(:research_center).permit(:name)
  end
end
