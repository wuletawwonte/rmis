class MembersController < ApplicationController
  load_and_authorize_resource

  def create
    @proposal = Proposal.find_by_id(params[:proposal_id])
    @member = Member.new(member_params)
    @member.role = Member.roles[:co_investigator]
    @member.status = Member.statuses[:envited]

    if @member.save
      redirect_to proposal_path(@proposal), notice: 'Member envited successfully'
    else
      redirect_to proposals_path, notice: 'unable to add Member.'
    end
  end

  def accept_envitation
    @member = Member.find(params[:id])

    if @member.update(status: Member.statuses[:joined])
      redirect_to proposals_path, notice: 'Successfully joined the research team.'    
    else
      redirect_to proposals_path, notice: 'Unable to join the research team.'
    end
  end

  def decline_envitation
    @member = Member.find(params[:id])

    if @member.destroy
      redirect_to proposals_path, notice: 'Successfully declined from joining the research team.'    
    else
      redirect_to proposals_path, notice: 'Unable to decline the research team envitation.'
    end
  end

  private

  def member_params
    params.permit(:proposal_id, :user_id, :id, :status)
  end
end
