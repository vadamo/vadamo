module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Vadamo.com  |   Online Marketplace for Art"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{h(@title)}"
    end
  end

  def logo
    image_tag("Vadamo_logo.jpg", :alt => "Vadamo", :class => "round") 
  end

end
