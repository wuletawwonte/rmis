# frozen_string_literal: true

class ResearchCentersController < ApplicationController
  load_and_authorize_resource
  before_action :set_research_center, only: %i[show]

  def index
    @research_centers = ResearchCenter.order(:created_at).page params[:page]
  end

  def show
  end

  private

  def set_research_center
    @research_center = ResearchCenter.find(params[:id])
  end
end
