class ButtonComponent < ApplicationViewComponent

    TW_BUTTON_TYPE_CLASS = {
        primary: "text-white bg-purple-600 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple",
        secondary: "text-white text-gray-700 active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray",
    }.with_indifferent_access

    TW_SIZE_CLASS = {
        lg: "h-12 px-6 m-2 text-lg",
        md: "h-10 px-5 m-2",
        sm: "h-8 px-4 m-2 text-sm"
    }.with_indifferent_access

    param :label
    param :href
    option :icon,   optional: true
    option :size,   default: proc { :md }
    option :type,   default: proc { :primary }

    def parent_tag(&block)
        
        button_classes = class_names(
            TW_SIZE_CLASS[size],
            TW_BUTTON_TYPE_CLASS[type],
        )

        parent_tag_options = { class: button_classes }
        parent_tag_options[:href] = resolve_url(href) if href

        content_tag(html_tag, **parent_tag_options, &block)
    end

    private
        def html_tag
            href ? :a : :button 
        end
end
