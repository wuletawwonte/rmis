class MembersController < ApplicationController
  def create
    @member = Member.new(member_params);
    @member.role = Member.roles[:co_investigator];
    @member.status = Member.statuses[:envited];
    
    if @member.save
      render partial: "proposals/members", locals: { members: Member.all }
    else 
      redirect_to proposals_path, notice: 'unable to add Member.'
    end

  end

  private 
    def member_params
      params.permit(:proposal_id, :user_id)
    end
end
