class MembersController < ApplicationController
  def create
    @proposal = Proposal.find_by_id(member_params['proposal_id'])
    @member = Member.new(member_params)
    @member.role = Member.roles[:co_investigator]
    @member.status = Member.statuses[:envited]

    if @member.save
      redirect_to proposal_path(@proposal), notice: 'Member envited successfully'
    else
      redirect_to proposals_path, notice: 'unable to add Member.'
    end
  end

  private

  def member_params
    params.permit(:proposal_id, :user_id)
  end
end
