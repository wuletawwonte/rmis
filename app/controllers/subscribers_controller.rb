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

  # PATCH/PUT /subscribers/1 or /subscribers/1.json
  def update
    respond_to do |format|
      if @subscriber.update(edit_subscriber_params)
        format.html { redirect_to subscribers_index_path, notice: 'Research type was successfully updated.' }
        format.json { render :show, status: :ok, location: @research_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private 

    # Only allow a list of trusted parameters through.
    def subscriber_params
      params.permit(:email)
    end

    def edit_subscriber_params
      params.require(:subscriber).permit(:id, :email, :active)
    end

end
