class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.urlsafe_base64
      user.email = auth.info.email
      user.save!
    end
  end




#   def self.from_omniauth(access_token)
#     data = access_token.info
#     user = User.where(:email => data["email"]).first
#
#     # Uncomment the section below if you want users to be created if they don't exist
#     unless user
#         user = User.create(name: data["name"],
#            email: data["email"],
#            password: Devise.friendly_token[0,20]
#         )
#     end
#     user
# end

#^^trying this...

end
