class SubscribersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create update verify_email email_verified]
  layout 'login', only: %i[email_verified]


  # GET /subscribers or /subscribers.json
  def index
    @subscribers = Subscriber.all.order(created_at: :desc).page params[:page]
  end

  # Post /subscribers/create to create a subscriber
  def create
    @subscriber = Subscriber.new(subscriber_params)

    puts subscriber_params

    respond_to do |format|
      if @subscriber.save
        SubscriberMailer.with(subscriber: @subscriber).email_added.deliver_later

        format.html { redirect_to root_url, notice: 'A verification link is sent to your email please click the link to start receiving emails about a new research call.' }
        format.json { render :list, status: :created, location: @subscriber }
      else
        format.html { redirect_to root_url, status: :unprocessable_entity }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscribers/1 or /subscribers/1.json
  def update
    @subscriber = Subscriber.find(edit_subscriber_params[:id])

    @subscriber.active = !@subscriber.active
    respond_to do |format|
      if @subscriber.save!
        format.json { render json: @subscriber, status: :ok, location: @research_type }
      else
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end 

  # Activate email address to receive research call posts
  def verify_email
    @subscriber = Subscriber.find_by_subscription_hash(params[:subscription_hash])
    
    @subscriber.active = true
    respond_to do |format|
      if @subscriber.save!
        SubscriberMailer.with(subscriber: @subscriber).email_verified.deliver_later

        format.html { redirect_to email_verified_path, notice: 'Your email is successfully verified.' }
      else
        format.html { redirect_to root_url, notice: 'Your email not verified.' }
      end
    end
  end

  # GET /subscribers/email_verified
  def email_verified; end

  private 

    # Only allow a list of trusted parameters through.
    def subscriber_params
      params.permit(:email)
    end

    def edit_subscriber_params
      params.permit(:id)
    end

end
