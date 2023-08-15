# frozen_string_literal: true

class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[show]

  def index
    @last_users = User.last(5).reverse
    @users = User.where.not(role: 'admin').order('created_at desc').page params[:page]
  end

  def researchers
    @researchers = User.all
  end

  def list
    @users = User.where.not(role: 'admin').order('created_at desc').page params[:page]
  end

  def show
    render partial: 'user_modal', locals: { user: @user } if turbo_frame_request?
  end

  def my_profile
    @user = User.find_by_id(current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
