class HeaderSectionComponent < ApplicationViewComponent
  option :title, optional: true
  
  renders_many :actions
end
