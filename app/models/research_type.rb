class ResearchType < ApplicationRecord
    has_many :proposals

    validates :name, presence: :true
end
