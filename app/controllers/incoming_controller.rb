class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

     
    # # # Find the user by using params[:sender]
    user = User.find_by(email: params[:sender])

    if user.nil?
      head 500
    end

    bookmark = user.bookmarks.build(url: params("body-plain")
    # # # Add the tag by using params[:subject]
    bookmark.tag_list.add(params[:subject])
    if bookmark.save
      head 200
    end
  end
end