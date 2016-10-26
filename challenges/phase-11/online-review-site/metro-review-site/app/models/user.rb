class User < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
end
