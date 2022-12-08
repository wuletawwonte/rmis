class ProposalsController < ApplicationController
  load_and_authorize_resource

  def index
    @proposals = Proposal.joined(current_user).page params[:page]
    @envitations = Member.envitations(current_user)
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

  def destroy
    @proposal = Proposal.find(params[:id]);
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @proposal = Proposal.find(params['id'])
    @members = Member.where(proposal_id: params['id'])
      .includes(:user)
      .page(params[:page])
      .per(params[:per])
      .max_paginates_per(4)
    @researchers = User.not_members_of(@proposal).page(params[:page]).per(params[:per]).max_paginates_per(4)
  end

  def search_researchers
    @proposal = Proposal.find_by_id(params['proposal_id'])

    if turbo_frame_request?
      if params['search_key'].present?      
        @researchers = User.not_members_of(@proposal).search_by_name(params['search_key']).page(params[:page]).max_paginates_per(4)
        render partial: 'researchers', locals: { researchers: @researchers, proposal: @proposal }
      else
        @researchers = User.not_members_of(@proposal).page(params[:page]).max_paginates_per(4)
        render partial: 'researchers', locals: { researchers: @researchers, proposal: @proposal }
      end
    else
      render partial: 'researchers', locals: { researchers: @researchers, proposal: @proposal }
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:id, :title, :attachement, :abstract, :call_id, :theme_id, :research_type_id,
                                     :budget)
  end

  def search_params
    params.permit(:search_key, :proposal_id)
  end

end
