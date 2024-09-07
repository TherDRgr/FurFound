class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {user: 0 , admin: 1}
  after_initialize :set_default_role, :if => :new_record?

  has_many :posts, dependent: :destroy

  def set_default_approved
    self.approved ||= false
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def set_default_role
    self.role ||= :user
  end
end
