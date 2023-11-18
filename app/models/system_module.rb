# == Schema Information
#
# Table name: system_modules
#
#  id          :bigint           not null, primary key
#  description :text
#  enabled     :boolean          default(FALSE)
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SystemModule < ApplicationRecord
end
