class User < ApplicationRecord
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :eventosbahais, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  #Admin
  has_many :mailer_managers, class_name: 'Admin::MailerManager'
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
