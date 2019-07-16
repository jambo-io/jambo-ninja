class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :eventosbahais, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  #Admin
  has_many :mailer_reports, class_name: 'Admin::MailerReport'
  accepts_nested_attributes_for :user_profile
  
  after_initialize :set_default_role, :if => :new_record?
  after_create :set_user_id


  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable,
         :trackable,
         :validatable
  enum role: [:user, :vip, :admin, :superuser]

  private
  def set_default_role
    self.role ||= :user
  end

  def set_user_id
    self.user_id = self.id
    self.save!
  end
end
