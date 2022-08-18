class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.where(user_id: current_user.id).includes(:user)
  end

  def new
    @proposal = Proposal.new
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
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :attachement, :abstract)
  end
end
