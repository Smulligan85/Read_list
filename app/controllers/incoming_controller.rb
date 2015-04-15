class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     # puts "INCOMING PARAMS HERE: #{params}"
     
    # # # Find the user by using params[:sender]
    @user = User.find_by(email: params[:sender])
    # # # Find the topic by using params[:subject]
    @tag = Bookmark.find_by(params[:subject])
    # # # Assign the url to a variable after retreiving it from params["body-plain"]
    @url = params["body-plain"]

    # # # Check if user is nil, if so, create and save a new user
    if @user.nil?
      @user = User.new(email: params[:sender], password: "temp0rary_passw0rd")
      @user.save!
    end

    # # # Check if the topic is nil, if so, create and save a new topic
    if @tag.nil?
      @tag = params[:subject]
      @tag.save!
    end

    # # # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = @user.bookmarks.build(bookmark_params)

    # Assuming all went well. 
    head 200
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:url, :tag_id)
  end

end