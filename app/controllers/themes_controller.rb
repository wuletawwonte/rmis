class ThemesController < ApplicationController
  def index
    @themes = Theme.all.includes(:research_center)
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

  def destroy; end

  private

  def theme_params
    params.require(:theme).permit(:title, :description, :research_center_id)
  end
end
