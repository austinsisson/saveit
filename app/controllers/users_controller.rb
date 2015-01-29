class UsersController < ApplicationController
  
  def show
    @bookmarks = current_user.bookmarks.group_by(&:topic)
    @liked = current_user.liked_bookmarks.group_by(&:topic)
  end
end
