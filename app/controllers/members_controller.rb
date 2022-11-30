class MembersController < ApplicationController
  def create
    @member = Member.new(member_params);
    @member.role = Member.roles[:co_investigator];
    @member.status = Member.statuses[:envited];
    
    if @member.save
      @researchers = Member.where(proposal_id: member_params[:proposal_id]).page(params[:page]).per(params[:per]).max_paginates_per(4)
      render partial: "proposals/members", locals: { members: @researchers }
    else 
      redirect_to proposals_path, notice: 'unable to add Member.'
    end

  end

  private 
    def member_params
      params.permit(:proposal_id, :user_id)
    end
end
