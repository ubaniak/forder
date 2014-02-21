class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_members
  has_many :groups, through: :group_members
  has_many :events, through: :groups

  def my_groups
      self.groups.where("group_members.confirmed = ?", true)
  end

  def my_invites
      self.groups.where("group_members.confirmed = ?", false)
  end

  def my_events
      self.events.where("open = ?", true)
  end
end
