# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title =  "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      "xxx" + base_title
    else
      "zzz{base_title} | #{@title}"
    end
  end
end
