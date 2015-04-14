class LikesController < ApplicationController
     def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)
 
     if like.save
        flash[:notice] = "You liked the bookmark!"
        redirect_to @bookmark
     else
       flash[:error] = "An error occurred. Please try again."
       redirect_to @bookmark
     end
   end

   def destroy
     # Get the bookmark from the params
     @bookmark = Bookmark.find(params[:bookmark_id])
     @like = current_user.likes.find(params[:user_id])
     # Find the current user's like with the ID in the params
 
     if like.destroy
        flash[:notice] = "You unliked the bookmark!"
        redirect_to @bookmark
     else
       flash[:error] = "An error occurred. Please try again."
       redirect_to @bookmark
     end
   end
end
