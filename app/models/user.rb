class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups

  def my_groups
      Group.joins(:group_members).where("user_id = ? and confirmed = ?", self.id, true)
  end
end
