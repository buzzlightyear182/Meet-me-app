class User < ActiveRecord::Base
# has_many :visits

	validates :user_name, presence: true, length: {maximum: 10}, format: {with: /\A[a-zA-Z0-9]+\z/}
	validates :password, presence: true
	validates_presence_of :email, format: {with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/}

end