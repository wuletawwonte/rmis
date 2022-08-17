class ThemesController < ApplicationController
  def index
    @themes = Theme.all.includes(:research_centers)
  end

  def new
    @theme = Theme.new
    @research_centers = ResearchCenter.all
  end

  def create
    @theme = Theme.new(theme_params)
    
    if @theme.save
      redirect_to themes_path, notice: 'Successfully added.'
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def theme_params
    params.resource(:theme).permit(:title, :description)
  end
end
