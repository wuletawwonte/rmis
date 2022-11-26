class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index; end

  def researchers
    @researchers = User.all
  end

  def list
    @users = User.all.order(:created_at).page params[:page]
  end

  def show
  end

  private 
    def set_user
      @user = User.find(params[:id])
    end
end
