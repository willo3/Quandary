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
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678797110/Quandary%20Avatars/Avatar_Froggo_3_pehjhg.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798232/Quandary%20Avatars/Avatar_Bear_1_love_crzgrb.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798232/Quandary%20Avatars/Avatar_Bear_2_love_ihkgtp.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798232/Quandary%20Avatars/Avatar_Birb_love_rrkdcx.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798234/Quandary%20Avatars/Avatar_Cat_1_love_vaccxr.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798234/Quandary%20Avatars/Avatar_Cat_2_love_jbzwle.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798232/Quandary%20Avatars/Avatar_Froggo_1_love_i19lvr.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798232/Quandary%20Avatars/Avatar_Froggo_2_love_fkeawm.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798232/Quandary%20Avatars/Avatar_Froggo_3_love_qzpsed.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798833/Quandary%20Avatars/Avatar_Bear_1_Hooray_em8kl8.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678816196/Quandary%20Avatars/Avatar_Bear_2_Hooray_skclzh.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798833/Quandary%20Avatars/Avatar_Birb_Hooray_f8ttmw.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798833/Quandary%20Avatars/Avatar_Cat_1_Hooray_tvgh75.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678816195/Quandary%20Avatars/Avatar_Cat_2_Hooray_r1valr.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798833/Quandary%20Avatars/Avatar_Froggo_1_Hooray_auzq7h.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798834/Quandary%20Avatars/Avatar_Froggo_2_Hooray_oprpbt.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678798834/Quandary%20Avatars/Avatar_Froggo_3_Hooray_yb67vh.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678799364/Quandary%20Avatars/Avatar_Bear_1_Shout_jnf529.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678799364/Quandary%20Avatars/Avatar_Bear_2_Shout_rfsicy.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678799364/Quandary%20Avatars/Avatar_Cat_1_Shout_x25rpv.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678799364/Quandary%20Avatars/Avatar_Cat_2_Shout_o5bywq.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678799364/Quandary%20Avatars/Avatar_Froggo_1_Shout_ktzlw5.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678799364/Quandary%20Avatars/Avatar_Froggo_2_Shout_idovpd.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678799366/Quandary%20Avatars/Avatar_Froggo_3_Shout_gxws8w.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678800502/Quandary%20Avatars/Avatar_Shiba_Excite_gtfg9c.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678800502/Quandary%20Avatars/Avatar_Shiba_Love_ncooed.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678801025/Quandary%20Avatars/Avatar_Imp_Smiley_eurtmo.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678801026/Quandary%20Avatars/Avatar_Imp_Uwu_ewaj02.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678801025/Quandary%20Avatars/Avatar_Imp_Super_Happy_lmkn7h.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678800873/Quandary%20Avatars/Avatar_Imp_Excite_tpqozu.svg',
              'https://res.cloudinary.com/drfmymoki/image/upload/v1678801285/Quandary%20Avatars/Avatar_Imp_Wink_d6bxbz.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678835703/Quandary%20Avatars/Avatar_Octopus_1_Smile_bmnk38.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678835703/Quandary%20Avatars/Avatar_Octopus_1_Happy_q3rpep.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678835703/Quandary%20Avatars/Avatar_Octopus_1_Excite_ms3c4r.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678835703/Quandary%20Avatars/Avatar_Octopus_2_Smile_dvo0zc.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678835703/Quandary%20Avatars/Avatar_Octopus_2_Happy_kzg8yi.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678835703/Quandary%20Avatars/Avatar_Octopus_2_Excite_alg8ya.svg'
              # WEIRD AVATARS
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678801972/Quandary%20Avatars/Avatar_BatCat_i9owzj.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678801972/Quandary%20Avatars/Avatar_GhostCat_eziln7.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678802691/Quandary%20Avatars/Avatar_CatLollipop_brnnb7.svg',
              # FRUIT & VEG AVATARS
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678801972/Quandary%20Avatars/Avatar_Carrot_hgomxt.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678802321/Quandary%20Avatars/Avatar_Aubergine_y6vunb.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678802321/Quandary%20Avatars/Avatar_Tomato_icb2ek.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678802321/Quandary%20Avatars/Avatar_Onion_c2co50.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678802321/Quandary%20Avatars/Avatar_Dragonfruit_lvhtio.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678803978/Quandary%20Avatars/Avatar_Turnip_snruir.svg',
              # 'https://res.cloudinary.com/drfmymoki/image/upload/v1678803977/Quandary%20Avatars/Avatar_Banana_qsbph9.svg'
            ]
  belongs_to :game
  belongs_to :user
end
