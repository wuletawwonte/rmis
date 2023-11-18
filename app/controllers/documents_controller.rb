# frozen_string_literal: true

class DocumentsController < ApplicationController
  # GET /documents or /documents.json
  def index
    @documents = Document.order(created_at: :desc).page params[:page]
  end
end
