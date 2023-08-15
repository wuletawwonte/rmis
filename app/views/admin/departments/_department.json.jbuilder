# frozen_string_literal: true

json.extract! department, :id, :name, :created_at, :updated_at
json.url department_url(department, format: :json)
