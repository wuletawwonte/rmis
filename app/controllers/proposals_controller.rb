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

    @proposal.status = 'Active'
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
    @researchers = User.all
    @member = Member.new
  end

  def edit
    key = params['key']
    @researchers = User.where('first_name LIKE :search', search: "%#{key}%").limit(3)
    render(partial: 'researchers', locals: { researchers: @researchers, key: })
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :attachement, :abstract, :theme_id)
  end

  def member_params
    params.require(:proposal).permit(:key)
  end
end
