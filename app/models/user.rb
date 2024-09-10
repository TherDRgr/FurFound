class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {user: 0 , admin: 1}
  after_initialize :set_default_role, :if => :new_record?

  has_many :posts, dependent: :destroy

  before_create :generate_account_number

  mount_uploader :profile_picture, ProfilePictureUploader

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

  def generate_account_number
    month_year = Time.current.strftime("%m%y") # Current month and year in MMYY format
    random_digits = Array.new(12) { rand(0..9) }.join # Generate 12 random digits
    self.account_number = "#{month_year}#{random_digits}" # Combine them
  end

end
