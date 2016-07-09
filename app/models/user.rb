class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google,:facebook]
   validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :uname, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
 

  has_one :roles_user, class_name: 'RolesUser'
  has_one :role, class_name: 'Role' ,through: :roles_user
  has_many :user_interests, class_name: 'UserInterest', :dependent => :destroy
  has_many :interests, class_name: 'Interset', through: :user_interests
  has_many :userclubs, class_name: 'UserClub', :dependent => :destroy
  has_many :clubs, class_name: 'Club', through: :userclubs
  has_many :clubquestions, class_name: 'ClubQuestion'
  has_many :answers, class_name: 'Answer', :dependent => :destroy
  has_many :stories, class_name: 'Story', :dependent => :destroy
  has_many :storycomments, class_name: 'StoryComment', :dependent => :destroy
  has_many :ratingcategories, class_name: 'RatingCategory', through: :userratings
  has_many :storyratings, class_name: 'StoryRating', :dependent => :destroy

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :following_relationships, source: :following

  attachment_config = {
  s3_credentials: {
    access_key_id: S3_CREDENTIALS['AWS_ACCESS_KEY'],
    secret_access_key: S3_CREDENTIALS['AWS_SECRET_TOKEN'],
    bucket: S3_CREDENTIALS['AWS_BUCKET']
  },

  storage:        :s3,
  s3_protocol:    "http"
}

    has_attached_file :user_profile_pic,
      styles: { mini: '100x100>', normal: '320x320>' },
      default_style: :mini,
      url: '/spree/user_profile_pic/:id/:style/:basename.:extension',
      path: '/spree/user_profile_pic/:id/:style/:basename.:extension',
      default_url: '/default_interset.jpg',
      convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
      s3_headers: { 'Cache-Control' => 'max-age=315576000', 'Expires' => 1.year.from_now.httpdate }
     
    attachment_definitions[:user_profile_pic].merge!(attachment_config)
    validates_attachment :user_profile_pic,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

 
  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          uname: auth.info.nickname || auth.uid,
          email: email ? email : "#{auth.info.email}",
          password: Devise.friendly_token[0,20],
          confirmed_at: DateTime.now
        )
        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
   def active_for_authentication?
      super && account_active?
       true
   end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def follow(user_id)  
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

end
