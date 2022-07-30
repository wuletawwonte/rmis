class UsersController < ApplicationController

  layout "login", :only => [ :sign_in ]

  def index; end

end
