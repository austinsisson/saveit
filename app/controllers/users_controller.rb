class UsersController < ApplicationController
  
  def show
    @user = current_user
    bookmarks = @user.bookmarks.all
    @bookmarks = bookmarks.group_by(&:topic)    
  end
end
