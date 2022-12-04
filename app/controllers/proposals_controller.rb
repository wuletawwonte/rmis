class ProposalsController < ApplicationController
  load_and_authorize_resource
  
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
    @members = Member.where(proposal_id: params['id'])
      .includes(:user)
      .page(params[:page])
      .per(params[:per])
      .max_paginates_per(4)
    @member_ids = Member.researcher_ids params['id']
    @researchers = User.where.not(id: @member_ids).page(params[:page]).per(params[:per]).max_paginates_per(4)
  end

  def search_researchers
    @proposal = Proposal.find_by_id(params['proposal_id'])
    @member_ids = Member.researcher_ids @proposal.id
    @researchers = User.where.not(id: @member_ids)

    if params['key'].present?
      @researchers = @researchers.where(
        'first_name LIKE :search OR middle_name LIKE :search OR last_name LIKE :search', search: "%#{params['key']}%"
      ).page(params[:page]).max_paginates_per(4)
    else
      @researchers = @researchers.page(params[:page]).per(params[:per]).max_paginates_per(4)
    end

    if turbo_frame_request?
      render partial: 'researchers', locals: { researchers: @researchers, proposal: @proposal }
    else
      render :show
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:id, :title, :attachement, :abstract, :call_id, :theme_id, :research_type_id,
                                     :budget)
  end

  def member_params
    params.permit(:key, :proposal_id)
  end
end
