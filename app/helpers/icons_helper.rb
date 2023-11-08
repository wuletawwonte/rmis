module IconsHelper
  def icon(name, **kwargs)
    default_options = {width: "18", height: "18"}
    base_class = "fill-current"

    klass = kwargs.delete(:class)
    merged_options = default_options.merge(kwargs)
    inline_svg_tag "lineicons/#{name}.svg", class: "#{base_class} #{klass}", **merged_options
  end
end
