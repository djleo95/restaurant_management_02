class User < ApplicationRecord
  before_save :downcase_email

  has_many :order_tables, as: :target
  has_many :reviews, as: :target
  has_many :bills, as: :target

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  has_secure_password

  private
  def downcase_email
    self.email = email.downcase
  end
end
