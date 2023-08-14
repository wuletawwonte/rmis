# frozen_string_literal: true

json.array! @calls, partial: 'calls/call', as: :call
