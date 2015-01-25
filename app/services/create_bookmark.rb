class CreateBookmark
  
  def self.call(params)
    user = User.find_by(email: (params[:sender]))
    bookmark = Bookmark.create!(
      user:  user,
      url:   params["stripped-text"],
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
    if head 500
      RestClient.post 'https://api:"#{MAILGUN_API_KEY}"@api.mailgun.net/V2/app32619189.mailgun.org/messages',
      from:     "Admin <admin@saveit.com>",
      to:       params[:sender],
      subject:  "Create Bookmark Failed!",
      text:     "Oops! Looks like there was an issue with the bookmark you sent us. Please try again. -SaveIt Admin Team"
    end
  end
end