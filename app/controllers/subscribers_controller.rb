class SubscribersController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[create]


  # GET /subscribers or /subscribers.json
  def index
    @subscribers = Subscriber.all.order(:created_at).page params[:page]
  end

  # Post /subscribers/create to create a subscriber
  def create
    @subscriber = Subscriber.new(subscriber_params)

    puts subscriber_params

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to root_url, notice: 'Subscription added successfully.' }
        format.json { render :list, status: :created, location: @subscriber }
      else
        format.html { render root_url, status: :unprocessable_entity }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

    # Only allow a list of trusted parameters through.
    def subscriber_params
      params.permit(:email)
    end

end
