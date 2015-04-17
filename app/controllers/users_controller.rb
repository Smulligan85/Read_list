class UsersController < ApplicationController

  def index
    @user = current_user
    @user_bookmarks = @user.bookmarks
    @liked_bookmarks = @user.likes.map { |like| like.bookmark }
  end

  def show
    
  end

end