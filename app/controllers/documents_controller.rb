# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :check_module_enabled

  # GET /documents or /documents.json
  def index
    @documents = Document.order(created_at: :desc).page params[:page]
  end

  private

  def check_module_enabled
    redirect_to root_path, notice: "Module disabled" unless SystemModule.enabled?(:document_management)
  end
end
