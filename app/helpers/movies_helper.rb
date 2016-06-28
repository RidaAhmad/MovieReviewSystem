module MoviesHelper
  def title_titleize(title_parameter)
    return if title_parameter.blank?
    title_parameter.titleize
  end
end
