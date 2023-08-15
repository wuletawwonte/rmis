# frozen_string_literal: true

class Admin::AcademicRanksController < ApplicationController
  load_and_authorize_resource
  before_action :set_academic_rank, only: %i[show edit update destroy]

  # GET /academic_ranks or /academic_ranks.json
  def index
    @academic_ranks = AcademicRank.all.page params[:page]
  end

  # GET /academic_ranks/1 or /academic_ranks/1.json
  def show; end

  # GET /academic_ranks/new
  def new
    @academic_rank = AcademicRank.new
  end

  # GET /academic_ranks/1/edit
  def edit; end

  # POST /academic_ranks or /academic_ranks.json
  def create
    @academic_rank = AcademicRank.new(academic_rank_params)

    respond_to do |format|
      if @academic_rank.save
        format.html { redirect_to academic_rank_url(@academic_rank), notice: 'Academic rank was successfully created.' }
        format.json { render :show, status: :created, location: @academic_rank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @academic_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_ranks/1 or /academic_ranks/1.json
  def update
    respond_to do |format|
      if @academic_rank.update(academic_rank_params)
        format.html { redirect_to academic_rank_url(@academic_rank), notice: 'Academic rank was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_rank }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @academic_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_ranks/1 or /academic_ranks/1.json
  def destroy
    @academic_rank.destroy

    respond_to do |format|
      format.html { redirect_to academic_ranks_url, notice: 'Academic rank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_academic_rank
    @academic_rank = AcademicRank.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def academic_rank_params
    params.require(:academic_rank).permit(:name, :order_key)
  end
end
