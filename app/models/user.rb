#require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :friendships
  # followings
  has_many :followings, :through => :friendships,
                        :source  => :friend
  has_many :inverse_friendships, :class_name  => 'Friendship',
                                 :foreign_key => 'friend_id'
  # followers
  has_many :followers, :through => :inverse_friendships,
                       :source  => :user

  before_save :hash_new_password, :if => :password_changed?
  
  validates :email, :nick, presence: true
  validates :nick, uniqueness: true
  validates :password, presence: true, on: :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  # By default the form_helpers will set the new_pass to "",
  # we don't want to go saving this as a password
  def password_changed?
    !@new_pass.blank?
  end
  
  # list of available users to follow
  def to_follow
    followers_and_user = self.followings + [self]
    User.where.not(id: followers_and_user)
  end
  
  private
  # We need to encrypt the user password before saving
  def hash_new_password
    self.password = BCrypt::Password.create(@password)
  end
end
