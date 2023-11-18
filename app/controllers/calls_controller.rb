# frozen_string_literal: true

class CallsController < ApplicationController
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
end
