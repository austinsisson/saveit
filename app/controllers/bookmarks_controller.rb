class BookmarksController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]
  
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
  end
  
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    
    if @bookmark.destroy
      flash[:notice] = "Bookmark deleted!"
    else
      flash[:alert] = "An error occurred, please try again!"
    end
    
    redirect_to user_path
  end
  
    
  def like
    @user = current_user
    @bookmark = Bookmark.find(params[:id])
    @user.set_mark :liked, @bookmark
    redirect_to bookmarks_path
  end
  
  def unlike
    @user = current_user
    @bookmark = Bookmark.find(params[:id])
    @user.remove_mark :liked, @bookmark
    redirect_to user_path
  end
  
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url, :topic, :title, :description, :favicon)
  end
end
