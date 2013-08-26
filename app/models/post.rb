class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :post_comments

  validates_presence_of :title, :message, :category, :user

  def can_managed_by(user)
    if self.category.forum.idea.users.where("user_id = ?", user.id).first || self.user_id == user.id
      return true
    else
      return false
    end
  end
end