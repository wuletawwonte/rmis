class ButtonComponent < ApplicationViewComponent

    BASE_CLASS = "flex items-center justify-between".freeze

    TW_BUTTON_TYPE_CLASS = {
        primary: "text-white bg-purple-600 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple",
        secondary: "text-white text-gray-700 active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray",
    }.with_indifferent_access

    TW_SIZE_CLASS = {
        lg: "px-5 py-3 font-medium leading-5",
        md: "px-4 py-2 text-sm font-medium leading-5",
        sm: "px-3 py-1 text-sm font-medium leading-5"
    }.with_indifferent_access

    param :label
    param :href
    option :icon,           optional: true
    option :size,           default: proc { :md }
    option :type,           default: proc { :primary }
    option :full_rounded,   default: proc { :false }
    option :left_icon,      optional: true
    option :right_icon,     optional: true

    def parent_tag(&block)
        
        button_classes = class_names(
            BASE_CLASS,
            TW_SIZE_CLASS[size],
            TW_BUTTON_TYPE_CLASS[type],
            radius_class
        )

        parent_tag_options = { class: button_classes }
        parent_tag_options[:href] = resolve_url(href) if href

        content_tag(html_tag, **parent_tag_options, &block)
    end

    private
        def html_tag
            href ? :a : :button 
        end

        def radius_class
            full_rounded == true ? "rounded-full" : "rounded-lg"
        end
end
