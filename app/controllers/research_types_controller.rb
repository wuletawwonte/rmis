# frozen_string_literal: true

class ResearchTypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_research_type, only: %i[show]

  # GET /research_types or /research_types.json
  def index
    @research_types = ResearchType.all.order(:created_at).page params[:page]
  end

  # GET /research_types/1 or /research_types/1.json
  def show
  end

  # GET /research_types/1/edit
  def edit
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_research_type
    @research_type = ResearchType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def research_type_params
    params.require(:research_type).permit(:name, :call_based, :max_budget, :gender, :fund_soure, :min_researcher,
      :max_duration, :possible_extension)
  end
end
