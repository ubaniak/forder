class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_members
  has_many :groups, through: :group_members
  has_many :events, through: :groups

  def my_groups
      Group.joins(:group_members).where("user_id = ? and confirmed = ?", self.id, true)
  end

  def my_invites
      Group.joins(:group_members).where("user_id = ? and confirmed = ?", self.id, false)
  end

  def my_events
      self.events.where("open = ?", true)
  end
end
