class CreateBookmark
  
  def self.call(params)
    user = User.find_by(email: (params[:sender]))
    bookmark = Bookmark.new(
      user:  user,
      url:   params["stripped-text"],
      topic: params[:subject]
      )
    begin
      site = LinkThumbnailer.generate(bookmark.url)
    rescue LinkThumbnailer::BadUriFormat || URI::InvalidURIError
      UserMailer.bookmark_creation_failure(params).deliver
      false
    else
      bookmark.update(
        title: site.title,
        description: site.description,
        favicon: site.favicon
        )
      bookmark.save
    end
  end
end