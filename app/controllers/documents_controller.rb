# frozen_string_literal: true

class DocumentsController < ApplicationController
  skip_before_action :authenticate_user!
  layout "public"

  # GET /documents or /documents.json
  def index
    @documents = Document.order(created_at: :desc).page params[:page]
  end
end
