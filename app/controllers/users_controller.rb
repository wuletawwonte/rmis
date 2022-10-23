class UsersController < ApplicationController
  def index; end

  def researchers
    @researchers = User.all
  end
end
