class UsersController < ApplicationController
  def index; end

  def researchers
    @researchers = User.all
  end

  def list
    @users = User.all.order(:created_at).page params[:page]
  end
end
