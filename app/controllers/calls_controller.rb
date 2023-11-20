# frozen_string_literal: true

class CallsController < ApplicationController
  before_action :check_module_enabled

  # Get /calls to show on the homepage
  def index
    @calls = Call.order(deadline: :desc).page params[:page]
  end

  # Get /public/show/:id to show a single call for unauthenticated users
  def show
    @call = Call.includes(:user).find(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_call
    @call = Call.find(params[:id])
  end

  def check_module_enabled
    redirect_to root_path, notice: "Module disabled" unless SystemModule.enabled?(:call_management)
  end
end
