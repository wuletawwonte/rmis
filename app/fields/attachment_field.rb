# frozen_string_literal: true

require 'administrate/field/base'

class AttachmentField < Administrate::Field::ActiveStorage
  def to_s
    data
  end
end
