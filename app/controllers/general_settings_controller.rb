class GeneralSettingsController < ApplicationController
  before_action :set_general_setting, only: %i[ show edit update destroy ]

  # GET /general_settings or /general_settings.json
  def index
    @general_settings = GeneralSetting.all
  end

  # GET /general_settings/1 or /general_settings/1.json
  def show
  end

  # GET /general_settings/new
  def new
    @general_setting = GeneralSetting.new
  end

  # GET /general_settings/1/edit
  def edit
  end

  # POST /general_settings or /general_settings.json
  def create
    @general_setting = GeneralSetting.new(general_setting_params)

    respond_to do |format|
      if @general_setting.save
        format.html { redirect_to general_setting_url(@general_setting), notice: "General setting was successfully created." }
        format.json { render :show, status: :created, location: @general_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @general_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_settings/1 or /general_settings/1.json
  def update
    respond_to do |format|
      if @general_setting.update(general_setting_params)
        format.html { redirect_to general_setting_url(@general_setting), notice: "General setting was successfully updated." }
        format.json { render :show, status: :ok, location: @general_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @general_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_settings/1 or /general_settings/1.json
  def destroy
    @general_setting.destroy

    respond_to do |format|
      format.html { redirect_to general_settings_url, notice: "General setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_setting
      @general_setting = GeneralSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def general_setting_params
      params.fetch(:general_setting, {})
    end
end
