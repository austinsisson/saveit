class BookmarksController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
  end
  
  def show
  end
  
  def new
  end
  
  def create
    puts "INCOMING PARAMS HERE: #{params}"
    @user = User.find_by_email(params[:sender])
    @bookmark = @user.bookmarks.build(
      name: params["stripped-text"],
      topic: params[:subject]
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
    params.require(:bookmark).permit(:name, :topic)
  end
end
