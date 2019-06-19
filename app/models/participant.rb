class Participant < ApplicationRecord
  belongs_to :eventosbahai
  belongs_to :user
  has_one :itinerary, dependent: :destroy
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
    if self.administrative_function_id.present?
      AdministrativeFunction.find(self.administrative_function_id).name unless AdministrativeFunction.find(self.administrative_function_id).blank?
    end
  end

  def administrative_region
    if self.user.user_profile.administrative_region_id.present?
      AdministrativeRegion.find(self.user.user_profile.administrative_region_id).name unless AdministrativeRegion.find(self.user.user_profile.administrative_region_id).blank?
    end
  end
end
