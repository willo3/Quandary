class Player < ApplicationRecord
  AVATARS = [ 'https://res.cloudinary.com/drfmymoki/image/upload/v1678448719/Quandary%20Avatars/Avatar_Imp_hpf7ae.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678354431/Quandary%20Avatars/Avatar_Bear_1_dg0cqd.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678354414/Quandary%20Avatars/Avatar_Bear_2_yb5s5c.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678354431/Quandary%20Avatars/Avatar_Froggo_1_vbq7r2.svg'
              ]
  belongs_to :game
  belongs_to :user
end
