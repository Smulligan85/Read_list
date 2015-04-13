class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.save
    redirect_to root_path
  end

  def update
    @bookmark = Bookmark.find(params[:id])    
    if @bookmark.update_attributes(bookmark_params)
      @bookmark.save
      redirect_to root_path
    else
      flash[:error] = "Could not update bookmark. Please try again."
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to root_path
  end
private

  def bookmark_params
    params.require(:bookmark).permit(:url, :tag_list)
  end

end
