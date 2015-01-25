module ApplicationHelper
  
  def default_favicon(bookmark)
    bookmark.favicon == "" ? image_tag('default.png') : image_tag("#{bookmark.favicon}")
  end
  
  def url_fixer(url)
   /^http/i.match(url) ? url : "http://#{url}"
  end
end
