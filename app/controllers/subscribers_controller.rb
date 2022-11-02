class SubscribersController < ApplicationController
  # GET /subscribers or /subscribers.json
  def index
    @subscribers = Subscriber.all.order(:created_at).page params[:page]
  end

  # Post /subscribers/create to create a subscriber
  def create
    @subscriber = Call.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to root_url, notice: 'Subscription added successfully.' }
        format.json { render :list, status: :created, location: @subscriber }
      else
        format.html { render :list, status: :unprocessable_entity }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

    # Only allow a list of trusted parameters through.
    def subscriber_params
      params.require(:subscriber).permit(:email)
    end

end
