class ButtonComponent < ApplicationViewComponent
  BASE_CLASS = 'flex items-center justify-between'.freeze

  TW_BUTTON_TYPE_CLASS = {
    primary: 'text-white bg-purple-600 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple',
    secondary: 'text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400
    active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray'
  }.with_indifferent_access

  TW_SIZE_CLASS = {
    lg: 'px-5 py-3 font-medium leading-5',
    md: 'px-4 py-2 text-sm font-medium leading-5',
    sm: 'px-3 py-1 text-sm font-medium leading-5'
  }.with_indifferent_access

  param :label # Can be a string or an icon component
  param :href, optional: true # If present, the button will be an anchor tag
  option :icon, optional: true # If present, the button will be an icon button
  option :size, default: proc { :md } # :sm, :md, :lg
  option :type, default: proc { :primary } # :primary, :secondary
  option :full_rounded, default: proc { false } # If true the border will be full round
  option :left_icon, optional: true # If present, the button will have an icon on the left
  option :right_icon, optional: true # If present, the button will have an icon on the right
  option :submit, default: proc { false } # If true the button will be a submit button
  option :tooltip, optional: true # If present, the button will have a tooltip

  def parent_tag(&)
    button_classes = class_names(
      BASE_CLASS,
      TW_SIZE_CLASS[size],
      TW_BUTTON_TYPE_CLASS[type],
      radius_class
    )

    parent_tag_options = { class: button_classes }
    parent_tag_options[:href] = resolve_url(href) if href
    parent_tag_options[:type] = 'submit' if submit == true && href.nil?
    parent_tag_options[:title] = tooltip if tooltip

    content_tag(html_tag, **parent_tag_options, &)
  end

  private

  def html_tag
    href ? :a : :button
  end

  def radius_class
    full_rounded == true ? 'rounded-full' : 'rounded-lg'
  end
end
