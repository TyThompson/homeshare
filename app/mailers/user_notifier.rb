class UserNotifier < ActionMailer::Base
  default :from => 'admin@tiy-homeshare.herokuapp.com'

  def send_invite_email
    friend_email = 'tythompson@gmail.com'
    mail( :to => friend_email,
          :subject => 'Invited to a new home!' )
  end
end
