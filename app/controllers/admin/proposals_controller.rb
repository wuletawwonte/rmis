# frozen_string_literal: true

class Admin::ProposalsController < ApplicationController
  load_and_authorize_resource

  def index
    @proposals = Proposal.all.page params[:page]
  end

  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
