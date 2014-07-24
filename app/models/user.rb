class User < ActiveRecord::Base
# has_many :visits

	validates :user_name, presence: true, length: {maximum: 10}, format: {with: /\A[a-zA-Z0-9]+\z/}
	validates :password, presence: true
	validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}

end