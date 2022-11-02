class SubscribersController < ApplicationController
  # GET /subscribers or /subscribers.json
  def index
    @subscribers = Subscriber.all.order(:created_at).page params[:page]
  end
end
