# frozen_string_literal: true

class DashboardsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @last_users = User.last(5).reverse
    @users = User.where.not(role: 'admin').order('created_at desc').page params[:page]
  end
end
