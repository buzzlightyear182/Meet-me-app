class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :visits
has_many :locations


	validates :user_name, presence: true, length: {maximum: 10}, format: {with: /\A[a-zA-Z0-9]+\z/}
	validates :encrypted_password, presence: true
	validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}

end