class Player < ApplicationRecord
  AVATARS = [ 'https://res.cloudinary.com/drfmymoki/image/upload/v1678354431/Quandary%20Avatars/Avatar_Bear_1_dg0cqd.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678354414/Quandary%20Avatars/Avatar_Bear_2_yb5s5c.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678354431/Quandary%20Avatars/Avatar_Birb_i3uymd.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678354431/Quandary%20Avatars/Avatar_Cat_1_jqehqo.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678354414/Quandary%20Avatars/Avatar_Cat_2_f4sv5p.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678354431/Quandary%20Avatars/Avatar_Froggo_1_vbq7r2.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678354414/Quandary%20Avatars/Avatar_Froggo_2_ddynz0.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678796762/Quandary%20Avatars/Avatar_Imp_dbc3ns.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678797373/Quandary%20Avatars/Avatar_Shiba_heoqqe.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678797110/Quandary%20Avatars/Avatar_Froggo_3_pehjhg.svg'
              ]
  belongs_to :game
  belongs_to :user
end
