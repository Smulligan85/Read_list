class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create


    # You put the message-splitting and business
    # magic here. 

    # Find the user by using params[:sender]
    @user = User.find(params[:sender])
    # Find the topic by using params[:subject]
    @tag = Bookmark.find(@user.tag)
    # Assign the url to a variable after retreiving it from params["body-plain"]
    @url = Bookmark.find(params["body-plain"])

    # Check if user is nil, if so, create and save a new user
    if @user == nil
      @user.create.save
    end

    # Check if the topic is nil, if so, create and save a new topic
    if @tag == nil
      @tag.save
    end

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = Bookmark.build(params[:user, :tag])

    # Assuming all went well. 
    head 200
  end

end