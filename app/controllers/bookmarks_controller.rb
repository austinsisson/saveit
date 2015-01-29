class BookmarksController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :bookmark_id, only: [:destroy, :like, :unlike]
  
  def index
    bookmarks = Bookmark.all
    @bookmarks = bookmarks.group_by(&:topic)
    authorize @bookmarks
  end
  
  def show
    @bookmarks = Bookmark.where(topic: params[:id])
  end
  
  def create
    CreateBookmark.call(params)
    head 200
  end
  
  
  def destroy    
    if @bookmark.destroy
      flash[:notice] = "Bookmark deleted!"
    else
      flash[:alert] = "An error occurred, please try again!"
    end
    
    redirect_to user_path
  end
  
    
  def like
    current_user.set_mark :liked, @bookmark
    redirect_to :back
  end
  
  def unlike
    current_user.remove_mark :liked, @bookmark
    redirect_to :back
  end
  
  protected
  
  def bookmark_id
    @bookmark = Bookmark.find(params[:id])
  end
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url, :topic, :title, :description, :favicon)
  end
end
