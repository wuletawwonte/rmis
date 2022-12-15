class ThemesController < ApplicationController
  load_and_authorize_resource
  before_action :set_theme, only: %i[show]

  def index
    @themes = Theme.all.includes(:research_center).order(:created_at).page params[:page]
  end

  def new
    @theme = Theme.new
    @research_centers = ResearchCenter.all
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.user_id = current_user.id

    if @theme.save
      redirect_to themes_path, notice: 'Successfully added.'
    else
      render 'new'
    end
  end

  def show; end

  def destroy; end

  private

  def theme_params
    params.require(:theme).permit(:title, :description, :research_center_id)
  end

  def set_theme
    @theme = Theme.find(params[:id])
  end
end
