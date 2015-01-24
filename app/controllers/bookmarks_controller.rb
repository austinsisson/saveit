class BookmarksController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    bookmarks = Bookmark.all
    @bookmarks = bookmarks.group_by(&:topic)
    authorize @bookmarks
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if CreateBookmark.call(params)
      head 200
    else
      head 500
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url, :topic, :title, :description, :favicon)
  end
end
