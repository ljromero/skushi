class Friendship < ActiveRecord::Base
    
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  validate :different_users
  
  def different_users
    if user_id == friend_id
      errors.add(:same_user, "user cannot follow himself")
    end
  end
  
end
