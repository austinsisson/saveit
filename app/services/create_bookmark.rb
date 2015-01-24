class CreateBookmark
  
  def self.call(params)
    user = User.find_by(email: (params[:sender]))
    bookmark = user.bookmarks.build(
      url: params["stripped-text"],
      topic: params[:subject]
      )
    site = LinkThumbnailer.generate(bookmark.url)
    bookmark.update(
      title: site.title,
      description: site.description,
      favicon: site.favicon
      )
    bookmark.save
    head 200
  end
end