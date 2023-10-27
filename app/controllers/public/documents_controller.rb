# frozen_string_literal: true

module Public
  class DocumentsController < ApplicationController
    load_and_authorize_resource
    skip_before_action :authenticate_user!
    layout 'login'

    # GET /documents or /documents.json
    def index
      @documents = Document.order(created_at: :desc).page params[:page]
    end

    # GET /documents/1 or /documents/1.json
    def show
      @document = Document.find(params[:id])
    end
  end
end
