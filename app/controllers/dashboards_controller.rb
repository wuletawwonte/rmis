# frozen_string_literal: true

class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @last_users = User.last(5).reverse
    @users = User.where.not(role: 'admin').order('created_at desc').page params[:page]
  end
end
