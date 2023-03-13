class User < ApplicationRecord
  has_many :games, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 # validates :username, format: { without: /\b(?:your|list|of|profane|words)\b/i }

end
