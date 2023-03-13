class User < ApplicationRecord
  has_many :games, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  # validates :username, format: { without: /\b(?:your|list|of|profane|words)\b/i }
=======
 # validates :username, format: { without: /\b(?:your|list|of|profane|words)\b/i }
>>>>>>> 5b0054b76797d7b9cfc2cd5a7f987c0caed0e762

end
