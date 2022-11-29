class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.where(user_id: current_user.id).includes(:user).order(:created_at).page params[:page]
  end

  def new
    @proposal = Proposal.new
    @research_types = ResearchType.all
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user_id = current_user.id

    if @proposal.save
      redirect_to proposals_path, notice: 'Successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy; end

  def show
    @proposal = Proposal.includes(:user).find(params['id'])
    @members = Member.where(proposal_id: params['id']).includes(:user)
    @researchers = User.all.page(params[:page]).per(params[:per]).max_paginates_per(4)
    @member = Member.new
  end

  def search_researchers
    if params['key'].present?
      @researchers = User.where('first_name LIKE :search OR middle_name LIKE :search OR last_name LIKE :search', search: "%#{params["key"]}%").page(params[:page]).max_paginates_per(4)
    else
      @researchers = User.all.page(params[:page]).per(params[:per]).max_paginates_per(4)
    end

    if turbo_frame_request?
      render partial: "researchers", locals: { researchers: @researchers }
    else
      render :show
    end
  end

  private

    def proposal_params
      params.require(:proposal).permit(:title, :attachement, :abstract, :call_id, :theme_id, :research_type_id, :budget)
    end

    def member_params
      params.require(:proposal).permit(:key)
    end
end
