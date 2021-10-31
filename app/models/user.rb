class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    has_secure_password
  has_one_attached :avatar
end
