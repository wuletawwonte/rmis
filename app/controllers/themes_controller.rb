# frozen_string_literal: true

class ThemesController < ApplicationController
  load_and_authorize_resource
  before_action :set_theme, only: %i[show]

  def index
    @themes = Theme.all.includes(:research_center).order(:created_at).page params[:page]
  end

  def show
  end

  private

  def set_theme
    @theme = Theme.find(params[:id])
  end
end
