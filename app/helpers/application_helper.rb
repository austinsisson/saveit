module ApplicationHelper
  
  def default_favicon(bookmark)
    bookmark.favicon == "" ? image_tag('default.png') : image_tag("#{bookmark.favicon}")
  end
end
