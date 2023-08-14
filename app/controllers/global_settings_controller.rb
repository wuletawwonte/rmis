# frozen_string_literal: true

class GlobalSettingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_global_setting, only: %i[index update]

  # GET /global_settings or /global_settings.json
  def index; end

  # PATCH/PUT /global_settings/1 or /global_settings/1.json
  def update
    respond_to do |format|
      if @global_setting.update(global_setting_params)
        format.html { redirect_to global_settings_path, notice: 'Global setting successfully updated.' }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_global_setting
    @global_setting = GlobalSetting.first
  end

  # Only allow a list of trusted parameters through.
  def global_setting_params
    params.require(:global_setting).permit(:university_name, :university_email, :university_phone, :university_city, :university_country, :allowed_pi_per_year, :allowed_co_per_year, :date_format,
                                           :default_password, :minimum_password_length, :university_website, :university_facebook, :university_twitter, :university_telegram)
  end
end
