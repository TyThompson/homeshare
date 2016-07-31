class UserNotifier < ActionMailer::Base
  default :from => 'admin@tiy-homeshare.herokuapp.com'

  def send_invite_email(friend_email,home_name)
    @friend_email = friend_email
    @home_name = home_name
    mail( :to => @friend_email,
          :subject => 'Invited to home:' @home_name )
  end
end
