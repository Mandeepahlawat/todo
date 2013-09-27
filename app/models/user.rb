class User < ActiveRecord::Base
  has_many :posts
  has_many :tasks, dependent: :destroy
  has_many :sent_messages, class_name: "Message", foreign_key: "user_id"
  has_many :messages_users
  has_many :received_messages, through: :messages_users, source: :message#, class_name: "Message", foreign_key: "user_id"
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable,
  			 :lockable, :timeoutable, :omniauthable, :omniauth_providers => [:facebook]

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         facebook_token:auth['credentials']['token'],
                         password:Devise.friendly_token[0,20]
                         )
    end
    user
  end

	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
