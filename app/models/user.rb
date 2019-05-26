class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  has_one :user_profile, dependent: :destroy

  after_initialize do
    build_user_profile if new_record? && user_profile.blank?
  end
  
  has_many :eventosbahais
  has_many :participants
  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :validatable
     
  accepts_nested_attributes_for :user_profile, allow_destroy: true

  def set_default_role
    self.role ||= :user
  end
end
