# frozen_string_literal: true

class FacultiesController < ApplicationController
  load_and_authorize_resource
  before_action :set_faculty, only: %i[show edit update destroy]

  # GET /faculties or /faculties.json
  def index
    @faculties = Faculty.all.page params[:page]
  end

  # GET /faculties/1 or /faculties/1.json
  def show; end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
  end

  # GET /faculties/1/edit
  def edit; end

  # POST /faculties or /faculties.json
  def create
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to faculty_url(@faculty), notice: 'Faculty was successfully created.' }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1 or /faculties/1.json
  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to faculty_url(@faculty), notice: 'Faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1 or /faculties/1.json
  def destroy
    @faculty.destroy

    respond_to do |format|
      format.html { redirect_to faculties_url, notice: 'Faculty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faculty
    @faculty = Faculty.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def faculty_params
    params.require(:faculty).permit(:name)
  end
end
