require 'bcrypt'
class User < ApplicationRecord
	include BCrypt
	has_secure_password
	has_many :eventosbahais
	has_many :participants, :through => :eventosbahais
	validates :name, presence:true, length: {maximum:60}
	validates :password, presence:true, length: {minimum:6}
	#VALID_EMAIL_FORMAT=/\w+@\w+\.{1}[a-zA-Z]{2,}/
	validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
	#validates :email, presence: true, length: {maximum:260}, format: {with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
	#before_save { self.email = :email.downcase }


end
