class User < ApplicationRecord
  validates :first_name, presence: true, length: {minimum: 3, maximum: 10}
  validates :last_name, presence: true, length:  {minimum: 3, maximum: 10}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cellphone, presence: true, numericality: true, :length => { minimum: 8, maximum: 8 }
end
