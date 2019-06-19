class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :eventosbahais, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile
  
  after_initialize :set_default_role, :if => :new_record?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :vip, :admin, :superuser]

  private

  def set_default_role
    self.role ||= :user
  end
end
