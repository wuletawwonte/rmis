class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.where(user_id: current_user.id).includes(:user)
  end

  def new
    @proposal = Proposal.new
    @themes = Theme.all
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user_id = current_user.id

    @proposal.status = 'Active'
    if @proposal.save
      redirect_to proposals_path, notice: 'Successfully added.'
    else
      render 'new'
    end
  end

  def destroy; end

  def show
    @proposal = Proposal.includes(:user).find(params['id'])
    @members = Member.where(proposal_id: params['id']).includes(:user)
    @researchers = User.all
    @member = Member.new
  end

  def edit; end

  def add_member
    @researchers = User.all
    render(partial: 'researchers', locals: { researchers: @researchers})
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :attachement, :abstract, :theme_id)
  end
end
