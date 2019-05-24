class User < ApplicationRecord
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :build_profile

  has_one :user_profile
  has_many :eventosbahais
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :validatable
		 
  def build_profile 
	self.build_user_profile
  end

  def set_default_role
    self.role ||= :user
  end
end
