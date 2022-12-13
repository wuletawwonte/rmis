class ResearchCentersController < ApplicationController
  load_and_authorize_resource
  before_action :set_research_center, only: %i[show edit update destroy]

  def index
    @research_centers = ResearchCenter.order(:created_at).page params[:page]
  end

  def show; end

  def new
    @research_center = ResearchCenter.new
    @research_center.build_user
  end

  def create
    @research_center = ResearchCenter.new(research_center_params)
    @research_center.build_user(research_center_params[:user_attributes])

    respond_to do |format|
      if @research_center.save
        format.html { redirect_to research_center_path(@research_center), notice: 'Research center was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
    
  end

  def edit; end

  def destroy
    @research_center.destroy

    respond_to do |format|
      format.html { redirect_to research_centers_url, notice: 'Research center successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def research_center_params
    params.require(:research_center).permit(:name, user_attributes: [:first_name, :middle_name, :email, :password, :role])
  end

  def set_research_center
    @research_center = ResearchCenter.find(params[:id])
  end

end
