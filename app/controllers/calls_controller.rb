class CallsController < ApplicationController
  before_action :set_call, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[list]
  layout 'login', only: %i[list]


  # Get /calls to show on the homepage
  def list
    @calls = Call.all
  end

  # GET /calls or /calls.json
  def index
    @calls = Call.order(:created_at).page params[:page]
  end

  # GET /calls/1 or /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls or /calls.json
  def create
    @call = Call.new(call_params)
    @call.user_id = current_user.id;

    respond_to do |format|
      if @call.save
        format.html { redirect_to call_url(@call), notice: "Call was successfully created." }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1 or /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to call_url(@call), notice: "Call was successfully updated." }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1 or /calls/1.json
  def destroy
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url, notice: "Call was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def call_params
      params.require(:call).permit(:title, :body, :published, :deadline)
    end
end
