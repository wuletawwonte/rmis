# frozen_string_literal: true

module Admin
  class ResearchTypesController < ApplicationController
    load_and_authorize_resource
    before_action :set_research_type, only: %i[show edit update destroy]

    # GET /research_types or /research_types.json
    def index
      @research_types = ResearchType.all.order(:created_at).page params[:page]
    end

    # GET /research_types/1 or /research_types/1.json
    def show; end

    # GET /research_types/new
    def new
      @research_type = ResearchType.new
    end

    # GET /research_types/1/edit
    def edit; end

    # POST /research_types or /research_types.json
    def create
      @research_type = ResearchType.new(research_type_params)

      respond_to do |format|
        if @research_type.save
          format.html { redirect_to admin_research_type_url(@research_type), notice: 'Research type was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /research_types/1 or /research_types/1.json
    def update
      respond_to do |format|
        if @research_type.update(research_type_params)
          format.html { redirect_to research_type_url(@research_type), notice: 'Research type was successfully updated.' }
          format.json { render :show, status: :ok, location: @research_type }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @research_type.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /research_types/1 or /research_types/1.json
    def destroy
      @research_type.destroy

      respond_to do |format|
        format.html { redirect_to research_types_url, notice: 'Research type was successfully destroyed.' }
        format.json { head :no_content }
      end
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
end
