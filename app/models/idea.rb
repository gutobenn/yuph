class Idea < ActiveRecord::Base
  has_many :idea_admins
  has_many :users, through: :idea_admins
  has_many :idea_comments
  has_many :follows
  has_many :followers, through: :follows, source: :user

  has_one :forum

  validates :name, presence: :true
  validates :image, presence: :true
  validates :mini_description, presence: :true
  validates :description, presence: :true

  def can_managed_by(user)
    if self.users.where("user_id = ?", user.id).first
      return true
    else
      return false
    end
  end
end
