class Participant < ApplicationRecord
  belongs_to :eventosbahai
  belongs_to :user
  has_one :itinerary, dependent: :destroy
  
  has_many :mailer_participants, dependent: :destroy
  has_many :admin_mailer_reports, through: :mailer_participants
  has_many :answers, dependent: :destroy
  #validates :contact, presence: true, length: { minimum:5 }
  #validates :name, presence: true, length: { minimum:2 }

  after_initialize do
    build_itinerary if new_record? && itinerary.blank?
  end

  accepts_nested_attributes_for :itinerary, allow_destroy: true

  def name
    self.user.user_profile.name unless self.user.blank? || self.user.user_profile.blank?
  end

  def lastname
    self.user.user_profile.lastname unless self.user.blank? || self.user.user_profile.blank?
  end

  def fullname
    self.user.user_profile.fullname unless self.user.blank? || self.user.user_profile.blank?
  end

  def birthday
    self.user.user_profile.birthday unless self.user.blank? || self.user.user_profile.blank?
  end

  def email
    self.user.email unless self.user.blank? || self.user.user_profile.blank?
  end

  def phone
    self.user.user_profile.phone unless self.user.blank? || self.user.user_profile.blank?
  end

  def state
    self.user.user_profile.state unless self.user.blank? || self.user.user_profile.blank?
  end

  def city
    self.user.user_profile.city unless self.user.blank? || self.user.user_profile.blank?
  end

  def address
    self.user.user_profile.address unless self.user.blank? || self.user.user_profile.blank?
  end

  def number
    self.user.user_profile.number unless self.user.blank? || self.user.user_profile.blank?
  end

  def zipcode
    self.user.user_profile.zipcode unless self.user.blank? || self.user.user_profile.blank?
  end

  def administrative_function
    user_id = self.user_id
    user_profile = UserProfile.where(user_id: user_id).first
    
    if user_profile.administrative_function_ref.present?
      AdministrativeFunction.find(user_profile.administrative_function_ref).name unless AdministrativeFunction.find(user_profile.administrative_function_ref).blank?
    end
  end

  def administrative_region
    regions_extense = ["Amazônia", "Centro-Oeste", "Nordeste", "Norte", "Sudeste", "Sul"]
    regions_min = ["AM", "CO", "NE", "NO", "SE", "S"]

    if self.user.user_profile.administrative_region_ref.present?
      adm_id = AdministrativeRegion.find(self.user.user_profile.administrative_region_ref).id unless AdministrativeRegion.find(self.user.user_profile.administrative_region_ref).blank?
      regions_min[adm_id-1]
    end
  end

  
end
