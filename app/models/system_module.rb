# == Schema Information
#
# Table name: system_modules
#
#  id          :bigint           not null, primary key
#  description :text
#  enabled     :boolean          default(FALSE)
#  key         :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_system_modules_on_key  (key) UNIQUE
#
class SystemModule < ApplicationRecord

  after_update :clear_cache

  validates :key, presence: true, uniqueness: true

  def self.enabled?(module_key)
    Rails.cache.fetch("system_module_#{module_key}", expires_in: 1.hour) do
      !!find_by(key: module_key)&.enabled?
    end
  end

  private

  def clear_cache
    Rails.cache.delete("system_module_#{key}")
  end
end
