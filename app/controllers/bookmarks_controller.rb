class BookmarksController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    bookmarks = Bookmark.all
    @bookmarks = bookmarks.group_by(&:topic)
  end
  
  def show
  end
  
  def new
  end
  
  def create
    @user = User.find_by(email: (params[:sender]))
    @bookmark = @user.bookmarks.build(
      url: params["stripped-text"],
      topic: params[:subject]
      )
    site = LinkThumbnailer.generate(@bookmark.url)
    @bookmark.update(
      title: site.title,
      description: site.description,
      favicon: site.favicon,
      )
    @bookmark.save
    head 200
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:name, :topic, :title, :description, :favicon)
  end
end
