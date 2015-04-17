class UsersController < ApplicationController

  def index
    @user = current_user
    @user_bookmarks = @user.bookmarks
    # @liked_bookmarks = @user.bookmarks.tag
  end

  def show
    
  end

end