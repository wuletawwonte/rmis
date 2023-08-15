# frozen_string_literal: true

json.extract! academic_rank, :id, :name, :order_key, :created_at, :updated_at
json.url academic_rank_url(academic_rank, format: :json)
