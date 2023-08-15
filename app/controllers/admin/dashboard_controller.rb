# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[index]
    # load_and_authorize_resource
    before_action :set_user, only: %i[show]

    def index
      @last_users = User.last(5).reverse
      @users = User.where.not(role: 'admin').order('created_at desc').page params[:page]
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
