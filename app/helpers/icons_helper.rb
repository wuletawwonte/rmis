module IconsHelper
  def icon(name, options = {})
    default_options = {class: "fill-current", width: "18", height: "18"}

    merged_options = default_options.merge(options)
    inline_svg_tag "lineicons/#{name}.svg", **merged_options
  end
end
