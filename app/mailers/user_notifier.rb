class UserNotifier < ActionMailer::Base
  default :from => 'admin@tiy-homeshare.herokuapp.com'

  def send_invite_email
    mail( :to => 'tythompson@gmail.com',
          :subject => 'Invited to a new home!' )
  end
end
