json.extract! document, :id, :title, :description, :user_id, :attachement, :created_at, :updated_at
json.url document_url(document, format: :json)
