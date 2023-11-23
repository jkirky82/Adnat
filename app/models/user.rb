class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, :on => :create
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
     
    belongs_to :organisation, optional: true
    has_many :shifts
end
