class UserMailer < ApplicationMailer
  default from: "reading_list@example.com"

  def bookmark_email(user)
    @user = user
    @url = 'http://example.com/login' # Add url find code later
    mail(to: @user.email, subject: "New Bookmark Notification")
  end
end
