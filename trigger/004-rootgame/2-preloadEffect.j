library preloadEffect uses Utilities
    globals
        boolean LoadEffectFinish = false
        integer EffectCount = 1
        integer MaxEffect = 7
    endglobals

    private function PreloadEffect takes string str returns nothing
        call DestroyEffect(AddSpecialEffect(str, WorldBounds.playMaxX, WorldBounds.playMaxY))
    endfunction

    function LoadEffectStart takes integer uid returns nothing
        local integer eid = EffectCount
        if uid == 'H03A' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\blazingwind.mdl")
                call PreloadEffect("war3mapImported\\Holy_Fire_Slam3.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl")
                call PreloadEffect("war3mapImported\\mc natsu.mdl")
                call PreloadEffect("war3mapImported\\natsufire1.mdl")
                call PreloadEffect("war3mapImported\\dtrednoring.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\Natsu Fire.mdl")
                call PreloadEffect("war3mapImported\\Holy_Fire_Slam2.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\fireeffectorange.mdl")
                call PreloadEffect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl")
                call PreloadEffect("war3mapImported\\EffecktNatsuHand1.mdl")
                call PreloadEffect("war3mapImported\\WindCircleFaster.mdl")
                call PreloadEffect("war3mapImported\\fireshockrun1.mdl")
                call PreloadEffect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_Kong.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\punchshot.mdl")
                call PreloadEffect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdl")
                call PreloadEffect("war3mapImported\\[A]AZ_TormentedSoul_T1_3.mdl")
                call PreloadEffect("war3mapImported\\qj3.mdl")
            elseif eid == 6 then   
                call PreloadEffect("war3mapImported\\BreathOfFireMissile.mdl")
                call PreloadEffect("war3mapImported\\fireleaf.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl")
                call PreloadEffect("war3mapImported\\hellblast.mdl")
                call PreloadEffect("war3mapImported\\FireNova.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl")
            endif
        endif
        if uid == 'H02E' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3_2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdl")
                call PreloadEffect("war3mapImported\\Dls1.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\zxd1.mdl")
                call PreloadEffect("war3mapImported\\djcjb.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl")
                call PreloadEffect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdl")
                call PreloadEffect("war3mapImported\\punchshot.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl")
                call PreloadEffect("war3mapImported\\fire-boom-new.mdl")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdl")
                call PreloadEffect("war3mapImported\\zxd1.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_1.mdl")
                call PreloadEffect("war3mapImported\\zxd6.mdl")
                call PreloadEffect("war3mapImported\\EarthDetonation.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\mbdm.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl")
            endif
        endif
        if uid == 'H02L' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\ZoroWave.mdl")
                call PreloadEffect("war3mapImported\\SkyNeutralBuildingExplosion.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\hakensaber2.mdl")
                call PreloadEffect("war3mapImported\\az_fireringblue.mdl")
                call PreloadEffect("war3mapImported\\wind3.mdl")
                call PreloadEffect("war3mapImported\\CF2.mdl")
                call PreloadEffect("war3mapImported\\airpalm.mdl")
                call PreloadEffect("war3mapImported\\animeslashfinal.mdl")
                call PreloadEffect("war3mapImported\\[A]ZoroEf.mdl")
                call PreloadEffect("war3mapImported\\az_magina[2]_b.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\zhendi-sand.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl")
                call PreloadEffect("war3mapImported\\[A]Sand3.mdl")
                call PreloadEffect("war3mapImported\\[A]ZoroEf6.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\az_red-xuanwo.mdl")
                call PreloadEffect("war3mapImported\\[A]RedGlow.mdl")
                call PreloadEffect("war3mapImported\\PredatorMark.mdl")
                call PreloadEffect("war3mapImported\\AZ_Slark_N2.mdl")
                call PreloadEffect("war3mapImported\\t_hit_p.mdl")
                call PreloadEffect("war3mapImported\\AZ_Axe_E1.mdl")
                call PreloadEffect("war3mapImported\\[A]ZoroEf0.mdl")
                call PreloadEffect("war3mapImported\\slash_red_glow1a.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\lb_hdg.mdl")
                call PreloadEffect("war3mapImported\\AZ_Goods_Phase Shoes(Green).mdl")
                call PreloadEffect("war3mapImported\\az_alleria_w2.mdl")
                call PreloadEffect("war3mapImported\\AZ_HYSBD.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]ZoroGreenSlashold.mdl")
                call PreloadEffect("war3mapImported\\[A]ZoroEf.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl")
                call PreloadEffect("war3mapImported\\blue-blink.mdl")
                call PreloadEffect("war3mapImported\\blue-zise-shousuo.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl")
                call PreloadEffect("war3mapImported\\star-magic.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]e_slashred.mdl")
                call PreloadEffect("war3mapImported\\DashKirei.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl")
            endif
        endif
        if uid == 'H03B' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\a(whiteblue)1.mdx")
                call PreloadEffect("war3mapimported\\WindCirclefaster.mdx")
                call PreloadEffect("war3mapimported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapimported\\windnewfaw3.mdx")
                call PreloadEffect("war3mapimported\\SuperShinyThingy2.mdx")
                call PreloadEffect("war3mapimported\\by_wood_flame_explosion_2_1.mdx")
                call PreloadEffect("war3mapimported\\FawEffects (11).mdx")
                call PreloadEffect("war3mapimported\\stingroar.mdx")
                call PreloadEffect("war3mapimported\\FawEffects (3).mdx")
                call PreloadEffect("war3mapimported\\StingEffect1.mdx")

                call PreloadEffect("war3mapimported\\SuperBigExplosion4.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\ExpWhiteFaw.mdx")
                call PreloadEffect("war3mapimported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapimported\\[A]DevilSlamDark.mdx")
                call PreloadEffect("war3mapimported\\WindNewFaw4.mdx")
                call PreloadEffect("war3mapimported\\CF2.mdx")
                call PreloadEffect("war3mapimported\\chongfeng2.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_5.mdx")
                call PreloadEffect("war3mapimported\\[A]ZoroEf2.mdx")
                call PreloadEffect("war3mapimported\\StingEffect.mdx")

                call PreloadEffect("war3mapimported\\[A]hit-white-guangxiao.mdx")
                call PreloadEffect("war3mapimported\\StingClaws.mdx")
                call PreloadEffect("war3mapimported\\[A]ama boom.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\[A]DarkPulseMisogi.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdx")
                call PreloadEffect("war3mapimported\\[A]ZoroEf3.mdx")
                call PreloadEffect("war3mapimported\\AuraCyan.mdx")
                call PreloadEffect("war3mapimported\\StingEucliffeMode.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\EarthSlamWhiteNew.mdx")
                call PreloadEffect("war3mapimported\\Almagest.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx")
                call PreloadEffect("war3mapimported\\StingRForm1.mdx")
                call PreloadEffect("war3mapimported\\az_slb.mdx")
                call PreloadEffect("war3mapimported\\[A]Sand3.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\by_wood_bashenan_juqi_1_4.mdx")
                call PreloadEffect("war3mapimported\\by_wood_effect_qigongbo_lan.mdx")
                call PreloadEffect("war3mapimported\\ChargeWhite.mdx")
                call PreloadEffect("war3mapimported\\by_wood_yangguangpuzhao.mdx")
                call PreloadEffect("war3mapimported\\bule-dark-salsh.mdx")
                call PreloadEffect("war3mapimported\\zhanji-pink-lizi.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_2.mdx")
                call PreloadEffect("war3mapimported\\WindWeak2.mdx")
                call PreloadEffect("war3mapimported\\WindWeak(Thicker).mdx")
                call PreloadEffect("war3mapimported\\EffecthPush.mdx")
                call PreloadEffect("war3mapimported\\amx (345).mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\ArcaneExplosion_Boss_Base.mdx")
                call PreloadEffect("war3mapimported\\EarthSlamWhiteSlashes.mdx")
                call PreloadEffect("war3mapimported\\File00000283.mdx")
                call PreloadEffect("war3mapimported\\ChuShou_BY_Wood_Effect_Unusual_Kof_BaShenAn_BaJiuBei_13.mdx")
            endif
        endif
        if uid == 'H030' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\DarkNova.mdl")
                call PreloadEffect("war3mapImported\\ShockwavePurple.mdl")
                call PreloadEffect("war3mapImported\\DTPurpleNoRing.mdl")
                call PreloadEffect("war3mapImported\\ZancrowAura(Black)4.mdl")
                call PreloadEffect("war3mapImported\\DTPurpleNoRing.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\DarkBlast.mdl")
                call PreloadEffect("war3mapImported\\Asuma-Explosion4.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\DarknessSphere.mdl")
                call PreloadEffect("war3mapImported\\Dead Spirit by Deckai3.mdl")
                call PreloadEffect("war3mapImported\\NewDirtEXNofire.mdl")
                call PreloadEffect("war3mapImported\\SuperBigExplosion4_2.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\PurpleNeutralBuildingExplosion.mdl")
                call PreloadEffect("war3mapImported\\EarthDetonation.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdl")
            endif
        endif
        if uid == 'H05R' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\valkkame3.mdl")
                call PreloadEffect("war3mapImported\\OrbitalRay.mdl")
                call PreloadEffect("war3mapImported\\FreezingRing.mdl")
                call PreloadEffect("war3mapImported\\Zero.mdl")
                call PreloadEffect("war3mapImported\\Asuma-Explosion.mdl")
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdl")
                call PreloadEffect("war3mapImported\\Firaga2.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\BlackBlink.mdl")
                call PreloadEffect("war3mapImported\\Lightnings Long.mdl")
                call PreloadEffect("war3mapImported\\Purple Aura.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\EarthDetonation.mdl")
                call PreloadEffect("war3mapImported\\HelGate1.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\ValkDust.mdl")
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\ShockwaveKuning.mdl")
                call PreloadEffect("war3mapImported\\SuperShinyThingy.mdl")
                call PreloadEffect("war3mapImported\\DustWave.mdl")
                call PreloadEffect("war3mapImported\\SuperBigExplosion.mdl")
                call PreloadEffect("war3mapImported\\Abyssal_Impact_Base.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\RedRing.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\NewDirtEXNofire.mdl")
                call PreloadEffect("war3mapImported\\howling2.mdl")
                call PreloadEffect("war3mapImported\\utsuhoredsun.mdl")
                call PreloadEffect("war3mapImported\\NuclearExplosion.mdl")
            endif
        endif
        if uid == 'H07C' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\xzcl.mdl")
                call PreloadEffect("war3mapImported\\mwjl.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\[DZ.Spell]0062.mdl")
                call PreloadEffect("war3mapImported\\crescentslashblue.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\tzl.mdl")
                call PreloadEffect("war3mapImported\\gikura_a.mdl")
                call PreloadEffect("war3mapImported\\windcirclefaster2.mdl")
                call PreloadEffect("war3mapImported\\shuizhuByyaycutsom.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\qjbuff.mdl")
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\AZ_Z017_21.mdl")
                call PreloadEffect("war3mapImported\\fire-boom-new.mdl")
                call PreloadEffect("war3mapImported\\FireEffectOrange.mdl")
                call PreloadEffect("war3mapImported\\slash_flareadditive195_2.mdl")
                call PreloadEffect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdl")
                call PreloadEffect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\glchj.mdl")
                call PreloadEffect("war3mapImported\\QQQQQ.mdl")
                call PreloadEffect("war3mapImported\\hit-juhuang-lizi.mdl")
                call PreloadEffect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl")
                call PreloadEffect("war3mapImported\\effect2.mdl")
                call PreloadEffect("war3mapImported\\FireSwordEffect.mdl")
                call PreloadEffect("war3mapImported\\SenjiSwordEffect.mdl")
                call PreloadEffect("war3mapImported\\HakenSaber2.mdl")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")

                call PreloadEffect("war3mapImported\\sjthy.mdl")
                call PreloadEffect("war3mapImported\\shanguangbiubiu.mdl")
                call PreloadEffect("war3mapImported\\cyzblueXT.mdl")
                call PreloadEffect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl")
                call PreloadEffect("war3mapImported\\az_tormentedsoul_t1.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\cyzdtred.mdl")
                call PreloadEffect("war3mapImported\\TanjirouEffectT.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl")
            endif
        endif
        if uid == 'H0AN' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\huoyandaoguang_1_1.mdl")
                call PreloadEffect("war3mapImported\\huoyantuci.mdl")
                call PreloadEffect("war3mapImported\\shunyihuoyan.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\BlackBlink.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\BloodEX.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\huozhu.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\KHFIRE3.mdl")
                call PreloadEffect("war3mapImported\\lightcircle.mdl")
                call PreloadEffect("war3mapImported\\effectother1.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\jxpx.mdl")
                call PreloadEffect("war3mapImported\\xjbz.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\HassanExpl3.mdl")
                call PreloadEffect("war3mapImported\\HassanPillar3.mdl")
            endif
        endif
        if uid == 'H0BM' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\[a]explodeorange.mdl")
                call PreloadEffect("war3mapImported\\Holy_Fire_Slam3.mdl")
                call PreloadEffect("war3mapImported\\[A]Natsu roar 3.mdl")
                call PreloadEffect("war3mapImported\\[A]FireShockRun(fire2).mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_Kong.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\[A]AceFireShockRun.mdx")
                call PreloadEffect("war3mapImported\\RedHarvest.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl")
                call PreloadEffect("war3mapImported\\[A]File00002800.mdl")
                call PreloadEffect("war3mapImported\\Ethereal Lightning.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\fire1.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\buff_fire.mdl")
                call PreloadEffect("war3mapImported\\qj3.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_FenShenDaBaoPo_2.mdl")
                call PreloadEffect("war3mapImported\\[A]Nuke2.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\[A]AceBall.mdl")
                call PreloadEffect("war3mapImported\\KatonGoukaMekkyaku.mdl")
                call PreloadEffect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl")
                call PreloadEffect("war3mapImported\\AceRef.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\[A]zhendi-fire-dici.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\ZeroPinkGreen.mdx")
                call PreloadEffect("war3mapimported\\[A]BY_Wood_XianHuo_2.mdx")
            endif
        endif
        if uid == 'H0CA' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\Shockwave White.mdl")
                call PreloadEffect("war3mapImported\\shadowdrive2.mdl")
                call PreloadEffect("war3mapImported\\chinesedragon.mdl")
                call PreloadEffect("war3mapImported\\DTBlueNoRingBlend.mdl")
                call PreloadEffect("war3mapImported\\byakuran ball.mdl")
                call PreloadEffect("war3mapImported\\DTBlueNoRingWhite.mdl")
                call PreloadEffect("war3mapImported\\WhiteXMissile.mdl")
                call PreloadEffect("war3mapImported\\Firaga5.mdl")
                call PreloadEffect("war3mapImported\\SuperBigExplosionBlack.mdl")
                call PreloadEffect("war3mapImported\\SuperShinyThingy2.mdl")

                call PreloadEffect("war3mapImported\\DarkBlast.mdl")
                call PreloadEffect("war3mapImported\\fireworksblack.mdl")
                call PreloadEffect("war3mapImported\\FiragaWhite.mdl")
                call PreloadEffect("war3mapImported\\SuperBigExplosion4.mdl")
                call PreloadEffect("war3mapImported\\SuperShinyThingy.mdl")
                call PreloadEffect("war3mapImported\\EarthDetonation.mdl")
                call PreloadEffect("war3mapImported\\fireworkswhite.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\WhiteDrive.mdl")
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdl")
                call PreloadEffect("war3mapImported\\blackblink.mdl")
                call PreloadEffect("war3mapImported\\punchshot.mdl")
                call PreloadEffect("war3mapImported\\bymutou_huozhu_siwang.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\Dead Spirit by Deckai3.mdl")
                call PreloadEffect("war3mapImported\\DarkNova.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\harmonizeeffect.mdl")
                call PreloadEffect("war3mapImported\\shinratensei.mdl")
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\DTBlueNoRingBlend.mdl")
                call PreloadEffect("war3mapImported\\DarkBreathDamage.mdl")
                call PreloadEffect("war3mapImported\\ShadowSlash.mdl")

                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\ExpWhiteFaw.mdx")
                call PreloadEffect("war3mapimported\\ArcaneExplosion_Boss_Base.mdx")
                call PreloadEffect("war3mapimported\\by_wood_flame_explosion_2_1.mdx")
                call PreloadEffect("war3mapimported\\EarthSlamWhiteSlashes.mdx")
                call PreloadEffect("war3mapimported\\File00000283.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\dustwaveanimate2.mdl")
                call PreloadEffect("war3mapImported\\hellbond.mdl")
                call PreloadEffect("war3mapImported\\az_doomdragon_d2.mdl")
                call PreloadEffect("war3mapImported\\dzxb1.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\Hell_Roots_Buff.mdl")
                call PreloadEffect("war3mapImported\\BloodEX.mdl")
            endif
        endif
        if uid == 'H0FS' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\blackblink.mdx")
                call PreloadEffect("war3mapImported\\zxd1.mdx")
                call PreloadEffect("war3mapImported\\by_wood_gongchengsipai_3.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\Chongfengnew.mdx")
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\dls2.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\SZBYAFB2.mdx")
                call PreloadEffect("war3mapimported\\62.mdx")
                call PreloadEffect("war3mapimported\\[A]SlamWithOut.mdx")
                call PreloadEffect("war3mapimported\\[A]Sand3.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\az_airfloww12.mdx")
                call PreloadEffect("war3mapImported\\ToumaReffect.mdx")
                call PreloadEffect("war3mapImported\\2953.mdx")
                call PreloadEffect("war3mapImported\\AZ_DK_T2.mdx")
                call PreloadEffect("war3mapImported\\pltx.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\shanguangbiubiu.mdx")
                call PreloadEffect("war3mapImported\\glowline(blue).mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Fgo_SuiPian_1_2.mdx")
                call PreloadEffect("war3mapImported\\QQQQQ.mdx")
                call PreloadEffect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdx")
                call PreloadEffect("war3mapImported\\ToumaE2.mdx")
                call PreloadEffect("war3mapImported\\ToumaE.mdx")
                call PreloadEffect("war3mapImported\\[A]GrassPisses.mdx")
                call PreloadEffect("war3mapImported\\dls1.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Texture_Flow_gqqg_blue.mdx")
                call PreloadEffect("war3mapImported\\[A]blue-shoot.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\wind2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\touma2.mdx")
                call PreloadEffect("war3mapImported\\Lulu_shadsd.mdx")
                call PreloadEffect("war3mapImported\\Light_chushou_by_wood_effect_huozhu_black.mdl")
                call PreloadEffect("war3mapImported\\Lulu_kaizokusfxbyvalk888.mdl")
            endif
        endif
        if uid == 'H0CT' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\earthdetonation.mdx")
                call PreloadEffect("war3mapimported\\Dls2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\blackblink.mdx")
                call PreloadEffect("war3mapImported\\dash sfx.mdx")
                call PreloadEffect("war3mapimported\\wind2.mdx")
                call PreloadEffect("war3mapimported\\odamarasengannormal.mdx")
                call PreloadEffect("war3mapimported\\flashaura.mdx")
                call PreloadEffect("war3mapimported\\[a]t_icesparks.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\wavejojo.mdx")
                call PreloadEffect("war3mapImported\\valkdustNew.mdx")
                call PreloadEffect("war3mapImported\\chongfeng2.mdx")
                call PreloadEffect("war3mapimported\\[a]sandpoff123.mdx")
                call PreloadEffect("war3mapimported\\SZBYAFB2.mdx")
                call PreloadEffect("war3mapimported\\SBXZAFB2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl")
                call PreloadEffect("war3mapImported\\punchshot.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl")
                call PreloadEffect("war3mapImported\\zxd6.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapimported\\lb_hdg.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\smokefuzzy.mdx")
                call PreloadEffect("war3mapImported\\[A]cherry blossom impact.mdx")
                call PreloadEffect("war3mapImported\\blinknew2.mdx")
                call PreloadEffect("war3mapImported\\fuzzystomp.mdx")
            endif
        endif
        if uid == 'H0CU' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\MeteorGlow.mdl")
                call PreloadEffect("war3mapimported\\[A]ymjfireball.mdl")
                call PreloadEffect("war3mapimported\\dash sfx.mdx")
                call PreloadEffect("war3mapimported\\wind2.mdx")
                call PreloadEffect("war3mapimported\\[a]explodeorange.mdx")
                call PreloadEffect("war3mapimported\\[A]Nuke2.mdx")
                call PreloadEffect("war3mapimported\\[A]asuma-explosion3.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapimported\\SenjiSwordEffect.mdx")
                call PreloadEffect("war3mapimported\\coarse slash yellow.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\SuperBigExplosion2.mdx")
                call PreloadEffect("war3mapimported\\[A]GonFef.mdx")
                call PreloadEffect("war3mapimported\\[A]Natsu ef roar.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\Adult Gohan (Piccolo's Clothing).mdx")
                call PreloadEffect("war3mapimported\\EarthDetonation.mdx")
                call PreloadEffect("war3mapimported\\[A]supershinythingyGon.mdx")
                call PreloadEffect("war3mapimported\\[A]AceBall.mdx")
                call PreloadEffect("war3mapimported\\cronosphere.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\AceRef.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\[A]LotusStar.mdx")
                call PreloadEffect("war3mapimported\\A(BlackPurple).mdx")
                call PreloadEffect("war3mapimported\\[A]SuperBigExpPurpleLow1.mdx")
                call PreloadEffect("war3mapimported\\[A]AsumaEXP4.mdx")
                call PreloadEffect("war3mapImported\\[A]TohkaExp.mdx")
                call PreloadEffect("war3mapimported\\[A]ExpPurple.mdx")
            endif
        endif
        if uid == 'H0CW' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\kizaruhitBlue.mdx")
                call PreloadEffect("war3mapimported\\blackblink.mdx")
                call PreloadEffect("war3mapimported\\StarPlatinumJ.mdx")
                call PreloadEffect("war3mapimported\\blackblink.mdx")
                call PreloadEffect("war3mapimported\\[A]Stoneslam_new9.mdx")
                call PreloadEffect("war3mapimported\\[a]sandpoff123.mdx")
                call PreloadEffect("war3mapimported\\[a]t_icesparks.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\[A]NewSparksEX.mdx")
                call PreloadEffect("war3mapimported\\wavejojo.mdx")
                call PreloadEffect("war3mapimported\\flashaura.mdx")
                call PreloadEffect("war3mapimported\\Hit.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\wind2.mdx")
                call PreloadEffect("war3mapimported\\Sprint_Cast_Base.mdx")
                call PreloadEffect("war3mapimported\\Room.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\shockwave big.mdx")
                call PreloadEffect("war3mapimported\\windexploreeffect(bigger).mdx")
                call PreloadEffect("war3mapimported\\[a]dustexplosion.mdx")
                call PreloadEffect("war3mapimported\\EarthDetonation.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\DevilSlam.mdx")
                call PreloadEffect("war3mapimported\\kaizokusfxbyvalk4.mdx")
                call PreloadEffect("war3mapimported\\BrokenGlass.mdx")
                call PreloadEffect("war3mapimported\\shockwave big.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\Ikadt1white.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\[A]effect_Howling_SFX.mdx")
                call PreloadEffect("war3mapimported\\[a]shockwave big.mdx")
                call PreloadEffect("war3mapimported\\fuzzystomp.mdx")
                call PreloadEffect("war3mapimported\\[a]sandpoff123.mdx")
                call PreloadEffect("war3mapimported\\zhendi-sand.mdx")
            endif
        endif
        if uid == 'H0D3' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\fireleaf.mdx")
                call PreloadEffect("war3mapimported\\fire-boom-new.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
                call PreloadEffect("war3mapimported\\az_tormentedsoul_t1.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\Sabo.mdx")
                call PreloadEffect("war3mapimported\\HyZLAFB.mdx")
                call PreloadEffect("war3mapimported\\DragonZhua.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\XZDL2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapimported\\az_tormentedsoul_t1.mdx")
                call PreloadEffect("war3mapimported\\firebbic.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\XZDL.mdx")
                call PreloadEffect("war3mapimported\\az_tormentedsoul_t1.mdx")
            endif
        endif
        if uid == 'H0CN' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl")
                call PreloadEffect("war3mapImported\\SatomiWind.mdl")
                call PreloadEffect("war3mapImported\\CF2.mdl")
                call PreloadEffect("war3mapImported\\star-magic.mdl")
                call PreloadEffect("war3mapImported\\qqqqqr.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
                call PreloadEffect("war3mapImported\\wind3.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\WindWeak(Thicker).mdl")
                call PreloadEffect("war3mapImported\\chongfeng2.mdl")
                call PreloadEffect("war3mapImported\\red-zhendi-shanguang.mdl")
                call PreloadEffect("war3mapImported\\az_hit-red-blade.mdl")
                call PreloadEffect("war3mapImported\\AZ_Jugg_E1.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl")
                call PreloadEffect("war3mapImported\\az_pafeathermoon_b.mdl")
                call PreloadEffect("war3mapImported\\az-zidan.mdl")
                call PreloadEffect("war3mapImported\\File00003933.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\StingEffect1.mdx")
                call PreloadEffect("war3mapimported\\WindNewFaw4.mdx")
                call PreloadEffect("war3mapimported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\ExpWhiteFaw.mdx")
                call PreloadEffect("war3mapImported\\lb_hdg.mdl")
                call PreloadEffect("war3mapImported\\HakenSaber2.mdl")
                call PreloadEffect("war3mapImported\\AZ_Alleria_R4.mdl")
                call PreloadEffect("war3mapImported\\by_wood_huoyanchongji_2_2.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl")
                call PreloadEffect("war3mapImported\\AZ_hit-red.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_2.mdl")
                call PreloadEffect("war3mapImported\\hit-blood-special.mdl")
                call PreloadEffect("war3mapImported\\jin xia.mdl")
                call PreloadEffect("war3mapImported\\red-blood-ball.mdl")
                call PreloadEffect("war3mapImported\\blood-rou.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\animeslashfinal.mdl")
                call PreloadEffect("war3mapImported\\hit-juhuang-lizi.mdl")
                call PreloadEffect("war3mapImported\\effect2.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\WindWeak2.mdl")
                call PreloadEffect("war3mapImported\\hero_juggernaut_n4s_e_line.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl")
            endif
        endif
        if uid == 'H0D6' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\LighWave3.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\wind3.mdl")
                call PreloadEffect("war3mapImported\\CF2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl")
                call PreloadEffect("war3mapImported\\rasengan_eff4.mdl")
                call PreloadEffect("war3mapImported\\white-shandian-qiquan-yellow.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\Ap235.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl")
                call PreloadEffect("war3mapImported\\chongfeng2.mdl")
                call PreloadEffect("war3mapImported\\QQQQQyellow.mdl")
                call PreloadEffect("war3mapImported\\az_slb.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\WindNewFaw4.mdl")
                call PreloadEffect("war3mapImported\\HolyPhoenixMissle1.mdl")
                call PreloadEffect("war3mapImported\\[A]Lightingcollection.mdl")
                call PreloadEffect("war3mapImported\\effect2.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\LightningBall.mdl")
                call PreloadEffect("war3mapImported\\File00007390.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\ChargeYellow.mdl")
                call PreloadEffect("war3mapImported\\AFB_aura_Yellow.mdl")
                call PreloadEffect("war3mapImported\\File00007390.mdl")
                call PreloadEffect("war3mapImported\\huoqiang02_T1.mdl")
                call PreloadEffect("war3mapImported\\MC Laxus.mdl")
                call PreloadEffect("war3mapImported\\az_sg2.mdl")
                call PreloadEffect("war3mapImported\\MystoganExp.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\NatsuLightning.mdl")
                call PreloadEffect("war3mapImported\\laxus_lightning_spear.mdl")
                call PreloadEffect("war3mapImported\\[A]LightStrikeArray4.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\LaxusSpark2.mdl")
                call PreloadEffect("war3mapImported\\[A]YellowMissile.mdl")
            endif
        endif
        if uid == 'H0DH' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\MC Gajeel.mdl")
                call PreloadEffect("war3mapImported\\bonesipji.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\punchshot.mdl")
                call PreloadEffect("war3mapImported\\bluedashsfx.mdl")
                call PreloadEffect("war3mapImported\\earthdetonation.mdl")
                call PreloadEffect("war3mapImported\\asuma-explosion.mdl")
                call PreloadEffect("war3mapImported\\helgate1.mdl")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Gajeel.mdl")
                call PreloadEffect("war3mapImported\\Dls2.mdl")
                call PreloadEffect("war3mapImported\\zxd5.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Gravitone.mdl")
                call PreloadEffect("war3mapImported\\SolarBall.mdl")
                call PreloadEffect("war3mapImported\\Bankai.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\WindCircleFaster.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl")
            endif
        endif
        if uid == 'H00F' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\slashdigital.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\blackblink.mdl")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\wind2.mdl")
                call PreloadEffect("war3mapImported\\62.mdl")
                call PreloadEffect("war3mapImported\\bloodex.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\punchshot.mdl")
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\HakenSaber2.mdl")
                call PreloadEffect("war3mapImported\\[A]howling_reverse_sfx.mdl")
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\[A]BlueRing.mdl")
                call PreloadEffect("war3mapImported\\[A]ZoroEf3.mdl")
                call PreloadEffect("war3mapImported\\[A]GrassPisses.mdl")
                call PreloadEffect("war3mapImported\\[A]t_icesparks.mdl")
                call PreloadEffect("war3mapImported\\[A]ZoroEf6.mdl")

                call PreloadEffect("war3mapImported\\[A]SlamWithOut.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\0203.mdl")
                call PreloadEffect("war3mapImported\\[A]zise-lizi-tous.mdl")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect302.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]blinkcasterWhite.mdl")
                call PreloadEffect("war3mapImported\\ginSFX1.mdl")
                call PreloadEffect("war3mapImported\\[A]ChuShou_Blue1.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\cleave.mdl")
                call PreloadEffect("war3mapImported\\ChuShou_Effect_Earth1.mdl")
                call PreloadEffect("war3mapImported\\Cyclon Explosion.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\1062.mdl")
                call PreloadEffect("war3mapImported\\3mihawkslashhit.mdl")
                call PreloadEffect("war3mapImported\\[A]blackstrike.mdl")
                call PreloadEffect("war3mapImported\\[A]blue-qiliu-daoguang_2.mdl")
                call PreloadEffect("war3mapImported\\[A]blue--zhendi3.mdl")
            endif
        endif
        if uid == 'H0EF' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
                call PreloadEffect("war3mapImported\\wind3.mdl")
                call PreloadEffect("war3mapImported\\WindWeak2.mdl")
                call PreloadEffect("war3mapImported\\WindWeak(Thicker).mdl")
                call PreloadEffect("war3mapImported\\[A]red-shoot-big.mdl")
                call PreloadEffect("war3mapImported\\wind2.mdl")
                call PreloadEffect("war3mapImported\\wavejojo.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl")
                call PreloadEffect("war3mapImported\\FireEffectOrange.mdl")
                call PreloadEffect("war3mapImported\\[A]FireEruption2.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\CF2.mdl")
                call PreloadEffect("war3mapImported\\chongfeng2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl")
                call PreloadEffect("war3mapImported\\AZ_PAFeathermoon_C_Caster.mdl")
                call PreloadEffect("war3mapImported\\az-zidan.mdl")
                call PreloadEffect("war3mapImported\\qqqqqr.mdl")
                call PreloadEffect("war3mapImported\\az_hitheavy.mdl")
                call PreloadEffect("war3mapImported\\AZ_hit-red.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\rasengan_eff4.mdl")
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl")
                call PreloadEffect("war3mapImported\\[A]Explodeorange.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\blue-guagnzhu-special.mdl")
                call PreloadEffect("war3mapImported\\File00000827.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl")
                call PreloadEffect("war3mapImported\\effect2.mdl")
                call PreloadEffect("war3mapImported\\hero_dwarvensniper_n3s_o_target.mdl")
                call PreloadEffect("war3mapImported\\az_pa_c33.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl")
                call PreloadEffect("war3mapImported\\blue-slash-more.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl")
                call PreloadEffect("war3mapImported\\animeslashfinal.mdl")

                call PreloadEffect("war3mapImported\\red-lizi-shunjian.mdl")
                call PreloadEffect("war3mapImported\\red-zhendi-shanguang.mdl")
                call PreloadEffect("war3mapImported\\hit-juhuang-lizi.mdl")
                call PreloadEffect("war3mapImported\\az_slb.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl")
                call PreloadEffect("war3mapImported\\gutsberserk.mdl")
                call PreloadEffect("war3mapImported\\az_pa_c-black.mdl")
                call PreloadEffect("war3mapImported\\AFBRedCharge.mdl")
                call PreloadEffect("war3mapImported\\File00003933.mdl")
                call PreloadEffect("war3mapImported\\red-blood-ball.mdl")

                call PreloadEffect("war3mapImported\\[A]wavejojo.mdl")
                call PreloadEffect("war3mapImported\\AZ_jingzi_jiansheng01_E1.mdl")
                call PreloadEffect("war3mapImported\\UltiZoro.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\red-qiquan.mdl")
                call PreloadEffect("war3mapImported\\red-yumao-zhendiLord.mdl")
                call PreloadEffect("war3mapImported\\bymutou-hongse3.mdl")
                call PreloadEffect("war3mapImported\\red-lizi-zhendi-fast.mdl")
                call PreloadEffect("war3mapImported\\AZ_PA_C.mdl")
                call PreloadEffect("war3mapImported\\blood-rou.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\ArrowSqwirl.mdl")
                call PreloadEffect("war3mapImported\\ChuShou_Effect_Earth1.mdl")
                call PreloadEffect("war3mapImported\\[A]SlashCirlce.mdl")
                call PreloadEffect("war3mapImported\\[A]Sand3.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\[A]Guts_wolf.mdx")
                call PreloadEffect("war3mapImported\\AZ_LCDark_T2_Buff.mdx")
            endif
        endif
        if uid == 'H0FU' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\[A]FireEruption2.mdl")
                call PreloadEffect("war3mapImported\\[A]Holy_Fire_Slam3.mdl")
                call PreloadEffect("war3mapImported\\File0000 (84).mdl")
                call PreloadEffect("war3mapImported\\FireEffectOrange.mdl")
                call PreloadEffect("war3mapImported\\[A]FireEruption2.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\blackblink1.mdl")
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\HakenSaber2.mdl")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\CF2.mdl")
                call PreloadEffect("war3mapImported\\chongfeng2.mdl")
                call PreloadEffect("war3mapImported\\wind3.mdl")
                call PreloadEffect("war3mapImported\\[A]earthdom(nocolor).mdl")
                call PreloadEffect("war3mapImported\\az_hitheavy.mdl")
                call PreloadEffect("war3mapImported\\[A]hit-white-guangxiao.mdl")

                call PreloadEffect("war3mapImported\\qqqqqr.mdl")
                call PreloadEffect("war3mapImported\\az-zidan.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl")
                call PreloadEffect("war3mapImported\\az_coco_t2.mdl")
                call PreloadEffect("war3mapImported\\blink-yellow2.mdl")
                call PreloadEffect("war3mapImported\\[A]Explodeorange.mdl")
                call PreloadEffect("war3mapImported\\FireEffectOrange.mdl")
                call PreloadEffect("war3mapImported\\buff_fire.mdl")
                call PreloadEffect("war3mapImported\\File0000 (85).mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl")

                call PreloadEffect("war3mapImported\\[A]FireEruption2.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl")
                call PreloadEffect("war3mapImported\\EscanorCruelSunExpAfb.mdl")
                call PreloadEffect("war3mapImported\\Genryuusai_onearmed.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl")
                call PreloadEffect("war3mapImported\\SatomiWind.mdl")
                call PreloadEffect("war3mapImported\\effect2.mdl")
                call PreloadEffect("war3mapImported\\[A]SlamWithOut.mdl")
                call PreloadEffect("war3mapImported\\AZ_hit-red.mdl")
                call PreloadEffect("war3mapimported\\bymutou_huozhu_hongse3.mdx")
                call PreloadEffect("war3mapimported\\red-yumao-zhendiLord.mdx")

                call PreloadEffect("war3mapimported\\AZ_Alleria_R3.mdx")
                call PreloadEffect("war3mapimported\\red-lizi-zhendi-fast.mdx")
                call PreloadEffect("war3mapimported\\az_baozha_red.mdx")
                call PreloadEffect("war3mapimported\\ChuShou_black.mdx")
                call PreloadEffect("war3mapimported\\bymutou-hongse3.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\qjbuff.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\Genryuusai.mdl")
                call PreloadEffect("war3mapImported\\WindExploreEffect(Bigger).mdl")
                call PreloadEffect("war3mapImported\\[A]GrassPisses.mdl")
                call PreloadEffect("war3mapImported\\[A]shockwave big.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_huoquan.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_Kong.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\[A]Explodeorange.mdl")
                call PreloadEffect("war3mapImported\\animeslashfinal.mdl")
                call PreloadEffect("war3mapImported\\[A]HibikiSlam.mdl")
                call PreloadEffect("war3mapImported\\az_hit-red-blade.mdl")
                call PreloadEffect("war3mapImported\\az_pafeathermoon_b.mdl")
                call PreloadEffect("war3mapImported\\az_hit-red-blade.mdl")
                call PreloadEffect("war3mapImported\\AZ_Jugg_E1.mdl")
            endif
        endif
        if uid == 'H0G2' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\djcjb.mdl")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\asknhq.mdl")
                call PreloadEffect("war3mapImported\\Dls1.mdl")
                call PreloadEffect("war3mapImported\\shuozhu1.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3.mdl")
                call PreloadEffect("war3mapImported\\az_tormentedsoul_t1.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdl")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
                call PreloadEffect("war3mapImported\\wind3.mdl")
                call PreloadEffect("war3mapImported\\SBXZAFB2.mdl")
                call PreloadEffect("war3mapImported\\XZDL2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\zunt.mdl")
                call PreloadEffect("war3mapImported\\shuozhu2.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\shuozhu3.mdl")
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\by_wood_effect_yuzhiboyou_unusual_yuedu_1.mdl")
                call PreloadEffect("war3mapImported\\AFBHQ.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3.mdl")
                call PreloadEffect("war3mapImported\\XZDL.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\BY_Wood_Decade_RiderKick_Ring.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl")
                call PreloadEffect("war3mapImported\\earthdetonation.mdl")
                call PreloadEffect("war3mapImported\\yayacleave.mdl")
            endif
        endif
        if uid == 'H003' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl")
                call PreloadEffect("war3mapImported\\SatomiWind.mdl")
                call PreloadEffect("war3mapImported\\CF2.mdl")
                call PreloadEffect("war3mapImported\\star-magic.mdl")
                call PreloadEffect("war3mapImported\\qqqqqr.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
                call PreloadEffect("war3mapImported\\wind3.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\rasengan_eff4.mdl")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]DiegoBox.mdl")
                call PreloadEffect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl")
                call PreloadEffect("war3mapImported\\[A]Explodeorange.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\kizaruhitBlue.mdx")
                call PreloadEffect("war3mapimported\\wavejojo.mdx")
                call PreloadEffect("war3mapimported\\wind2.mdx")
                call PreloadEffect("war3mapimported\\Sprint_Cast_Base.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]DiegoTheWorld.mdx")
                call PreloadEffect("war3mapimported\\Room.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\[A]bloodex.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]DiegoKnife.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\shockwave big.mdx")
                call PreloadEffect("war3mapimported\\windexploreeffect(bigger).mdx")
                call PreloadEffect("war3mapimported\\[a]dustexplosion.mdx")
                call PreloadEffect("war3mapimported\\EarthDetonation.mdx")
                call PreloadEffect("war3mapimported\\[A]NewSparksEX.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdl")
                call PreloadEffect("war3mapImported\\Dls1.mdl")
                call PreloadEffect("war3mapImported\\zxd1.mdl")
            endif
        endif
        if uid == 'H009' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BlackBlink.mdl")
                call PreloadEffect("war3mapImported\\zxd1.mdl")
                call PreloadEffect("war3mapImported\\zxd2.mdl")
                call PreloadEffect("war3mapImported\\Mr.War3_SLTZ.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\zxd5.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl")
                call PreloadEffect("war3mapImported\\zxd6.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\PainPathsN1Tendo.mdx")
                call PreloadEffect("war3mapImported\\PainPathsN2Chikushido.mdx")
                call PreloadEffect("war3mapImported\\PainPathsN3Ningendo.mdx")
                call PreloadEffect("war3mapImported\\PainPathsN4Gakido.mdx")
                call PreloadEffect("war3mapImported\\PainPathsN5Jigokudo.mdx")
                call PreloadEffect("war3mapImported\\PainPathsN6Asura.mdx")
                call PreloadEffect("war3mapimported\\AizenJHSY.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\peincsdniao.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Elp_XiaoQiDan_BaoZha_1.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\Chibaku Tensei.mdx")
            endif
        endif
        if uid == 'H00P' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BlackBlink.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl")
                call PreloadEffect("war3mapImported\\EarthDetonation.mdl")
                call PreloadEffect("war3mapImported\\[a]sandpoff123.mdl")
                call PreloadEffect("war3mapImported\\[a]t_icesparks.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\devilslam.mdx")
                call PreloadEffect("war3mapImported\\Chongfengnew.mdx")
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapImported\\hit.mdx")
                call PreloadEffect("war3mapImported\\djcjb.mdx")
                call PreloadEffect("war3mapImported\\zxd2.mdx")
                call PreloadEffect("war3mapImported\\[a]t_icesparks.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\[A]az_axe_ef1.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\hitwave.mdx")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdl")
                call PreloadEffect("war3mapImported\\Dls1.mdl")
                call PreloadEffect("war3mapImported\\zxd1.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Fgo_SuiPian_1_2.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
                call PreloadEffect("war3mapImported\\pltx.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
            endif
        endif
        if uid == 'H013' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\getsugatrap.mdx")
                call PreloadEffect("war3mapImported\\darkexcalibureffect1.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapImported\\devilslam.mdx")
                call PreloadEffect("war3mapImported\\DarkBlast.mdx")
                call PreloadEffect("war3mapImported\\daoguang_purp.mdx")
                call PreloadEffect("war3mapImported\\cyzdtred.mdx")
                call PreloadEffect("war3mapImported\\baojiang.mdx")
                call PreloadEffect("war3mapImported\\akiha claw black.mdx")
                call PreloadEffect("war3mapImported\\[A]AsumaEXP4.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]t_thunderclapcaster.mdx")
                call PreloadEffect("war3mapImported\\DashKirei.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\devilslam.mdx")
                call PreloadEffect("war3mapImported\\blackblink.mdx")
                call PreloadEffect("war3mapImported\\saberalterqc.mdx")
                call PreloadEffect("war3mapImported\\rb10.mdx")
                call PreloadEffect("war3mapImported\\SAlterEffect1.mdx")
                call PreloadEffect("war3mapImported\\[A]HibikiSlam_purp.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\SFXBreakGround.mdx")
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapImported\\Dash Sfx 2.mdx")
                call PreloadEffect("war3mapImported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapImported\\36-purp.mdx")
                call PreloadEffect("war3mapImported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapImported\\akiha claw black.mdx")
                call PreloadEffect("war3mapImported\\hakensaber2.mdx")
                call PreloadEffect("war3mapImported\\cf2.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")

                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\az_airfloww12.mdx")
                call PreloadEffect("war3mapImported\\2953.mdx")
                call PreloadEffect("war3mapImported\\exshexianblack.mdx")
                call PreloadEffect("war3mapImported\\FantasyBattle (1582).mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\nlygpz.mdx")
                call PreloadEffect("war3mapImported\\bossbirth.mdx")
                call PreloadEffect("war3mapImported\\[R]wave1.mdx")
            endif
        endif
        if uid == 'H00T' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\effect2.mdl")
                call PreloadEffect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\blackblink.mdx")
                call PreloadEffect("war3mapImported\\fireeffectorange.mdx")
                call PreloadEffect("war3mapImported\\firessl.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\wind4.mdx")
                call PreloadEffect("war3mapImported\\model (117)_2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_KOF_K_ReBanJi_YiZhiDan_2.mdl")
                call PreloadEffect("war3mapImported\\az_tormentedsoul_t1.mdl")
                call PreloadEffect("war3mapImported\\zxd1.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapimported\\Kaca_Pecah.mdx")
                call PreloadEffect("war3mapimported\\File00002105.mdx")
                call PreloadEffect("war3mapimported\\[A]ChuShou_Blue.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\exshexian111.mdl")
                call PreloadEffect("war3mapImported\\LW11.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\by_wood_effect_qigongbo_lan.mdx")
            endif
        endif
        if uid == 'H00V' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\BlackGetsuga2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\Dead Spirit by Deckai3.mdl")
                call PreloadEffect("war3mapImported\\EarthDetonation.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\az_red-xuanwo.mdx")
                call PreloadEffect("war3mapImported\\bymutou-hongse3.mdx")
                call PreloadEffect("war3mapImported\\red-qiquan.mdx")
                call PreloadEffect("war3mapImported\\dash sfx.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
                call PreloadEffect("war3mapImported\\RedRandomSlash.mdl")
                call PreloadEffect("war3mapImported\\fire-boom-new-red.mdl")
                call PreloadEffect("war3mapImported\\red-zhendi-shanguang.mdl")
                call PreloadEffect("war3mapImported\\red-lizi-zhendi-fast.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\red-zhendi-shanguang.mdx")
                call PreloadEffect("war3mapImported\\wind4.mdx")
                call PreloadEffect("war3mapImported\\bymutou_huozhu_siwang.mdl")
                call PreloadEffect("war3mapImported\\bymutou-hongse3.mdl")
                call PreloadEffect("war3mapImported\\qqqqqr.mdl")
                call PreloadEffect("war3mapImported\\az-zidan.mdl")
                call PreloadEffect("war3mapImported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdl")
                call PreloadEffect("war3mapImported\\IchigoGets.mdl")
                call PreloadEffect("war3mapImported\\red-yumao-zhendi-paoxiao.mdl")
                call PreloadEffect("war3mapImported\\Kuroi Getsuga Tenshou Red.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\AZ_PA_C.mdx")
                call PreloadEffect("war3mapImported\\[A]RedGlow.mdx")
                call PreloadEffect("war3mapImported\\AZ_hit-red.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx")
                call PreloadEffect("war3mapImported\\rasengan_eff4.mdx")
                call PreloadEffect("war3mapImported\\[A]SlashCirlce.mdx")
                call PreloadEffect("war3mapImported\\chongfeng2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl")
                call PreloadEffect("war3mapImported\\k4.mdl")
                call PreloadEffect("war3mapImported\\az_yin_q1.mdx")

                call PreloadEffect("war3mapImported\\az_red-xuanwo.mdx")
                call PreloadEffect("war3mapImported\\TX_White2.mdx")
                call PreloadEffect("war3mapImported\\yytc.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\FreezingRing.mdx")
                call PreloadEffect("war3mapImported\\DarkNova.mdx")
                call PreloadEffect("war3mapImported\\Desecrate.mdx")
                call PreloadEffect("war3mapImported\\darkblast.mdx")
                call PreloadEffect("war3mapImported\\Dead Spirit by Deckai3.mdx")
                call PreloadEffect("war3mapImported\\SuperShinyThingy2.mdx")
            endif
        endif
        if uid == 'H00W' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\MC 02.mdx")
                call PreloadEffect("war3mapimported\\SisTNld.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\baofeng.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\sistinaboom.mdl")
                call PreloadEffect("war3mapImported\\sistinatoushe.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\windgreen.mdx")
                call PreloadEffect("war3mapImported\\wzcfql2.mdl")
                call PreloadEffect("war3mapImported\\sistinaboom.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\Cyclon Explosion_green.mdl")
                call PreloadEffect("war3mapImported\\WDFZL_green.mdl")
                call PreloadEffect("war3mapImported\\[A]dustexplosion.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\123 (383)_2.mdx")
            endif
        endif
        if uid == 'H0EQ' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\Needle.mdl")
                call PreloadEffect("war3mapImported\\DTPurpleNoRing.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\dash sfx.mdx")
                call PreloadEffect("war3mapImported\\earthdetonation.mdx")
                call PreloadEffect("war3mapImported\\wind4.mdx")
                call PreloadEffect("war3mapImported\\Purple Aura.mdx")
                call PreloadEffect("war3mapImported\\SuperBigExplosion.mdx")
                call PreloadEffect("war3mapImported\\Asuma-Explosion.mdx")
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\hibary double box.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\XZDL2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\BlackBlink.mdx")
                call PreloadEffect("war3mapImported\\RedSlash2a.mdx")
                call PreloadEffect("war3mapImported\\az_slb.mdx")
                call PreloadEffect("war3mapImported\\az_magina[2]_b.mdx")
                call PreloadEffect("war3mapImported\\slam09.mdx")
                call PreloadEffect("war3mapImported\\violet spark by deckai.mdx")
                call PreloadEffect("war3mapImported\\HelGate1.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\ChainElement2.mdx")
                call PreloadEffect("war3mapImported\\HibariKyoya.mdx")
            endif
        endif
        if uid == 'H017' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdx")
                call PreloadEffect("war3mapImported\\blackblink.mdx")
                call PreloadEffect("war3mapImported\\HibikiQ.mdx")
                call PreloadEffect("war3mapImported\\earthdetonation.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdx")
                call PreloadEffect("war3mapImported\\Dls1.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\dustwaveanimate2.mdx")
                call PreloadEffect("war3mapImported\\[A]supershinythingyGon.mdx")
                call PreloadEffect("war3mapImported\\Chongfengnew.mdx")
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\zxd1.mdx")
                call PreloadEffect("war3mapImported\\dls2.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Light4.mdx")
                call PreloadEffect("war3mapImported\\HibikiR1.mdx")
                call PreloadEffect("war3mapImported\\ChargeWhite.mdx")
                call PreloadEffect("war3mapImported\\Light2.mdx")
                call PreloadEffect("war3mapImported\\[A]HibikiSlam.mdx")
                call PreloadEffect("war3mapImported\\HibikiR2.mdx")
                call PreloadEffect("war3mapImported\\HibikiR3.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
                call PreloadEffect("war3mapImported\\QQQQQ.mdx")
                call PreloadEffect("war3mapImported\\djcjb.mdx")
                call PreloadEffect("war3mapImported\\Hit.mdx")
                call PreloadEffect("war3mapImported\\wavejojo.mdx")
                call PreloadEffect("war3mapImported\\XZDL2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\Dustwavevin.mdx")
                call PreloadEffect("war3mapImported\\valkdustnew.mdx")
                call PreloadEffect("war3mapImported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\AgusWind.mdx")
                call PreloadEffect("war3mapImported\\SuperBigExplosion2.mdx")
                call PreloadEffect("war3mapImported\\[A]GonFef.mdx")
                call PreloadEffect("war3mapImported\\[A]Natsu ef roar.mdx")
            endif
        endif
        if uid == 'H05G' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\Shockwave(Blue).mdx")
                call PreloadEffect("war3mapImported\\LightningNova.mdx")
                call PreloadEffect("war3mapImported\\Dead Spirit by Deckai2.mdx")
                call PreloadEffect("war3mapImported\\Energy Release2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\dash sfx.mdx")
                call PreloadEffect("war3mapImported\\Dls2.mdx")
                call PreloadEffect("war3mapImported\\zxd3.mdx")
                call PreloadEffect("war3mapImported\\uissb.mdx")
                call PreloadEffect("war3mapImported\\wendyql.mdx")
                call PreloadEffect("war3mapImported\\nitu.mdx")
                call PreloadEffect("war3mapImported\\DarkBlade.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\XZBlue.mdx")
                call PreloadEffect("war3mapImported\\zhanji-bluex-shu2.mdx")
                call PreloadEffect("war3mapImported\\xjbz.mdx")
                call PreloadEffect("war3mapImported\\mkirito2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Effect_Fate_jiujian_galibang_dimianjianqi2.mdx")
                call PreloadEffect("war3mapImported\\bule-dark-salsh_21.mdx")
                call PreloadEffect("war3mapImported\\windslash.mdx")
                call PreloadEffect("war3mapImported\\bule-dark-salsh_2.mdx")
                call PreloadEffect("war3mapImported\\wind2.mdl")
                call PreloadEffect("war3mapImported\\blue-guagnzhu-special.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\JeanlilyHXDG1.mdx")
                call PreloadEffect("war3mapImported\\JeanlilyHXDG2.mdx")
                call PreloadEffect("war3mapImported\\zxd3.mdx")
                call PreloadEffect("war3mapImported\\specialanimedustwave.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei.mdx")
                call PreloadEffect("war3mapImported\\XZDL2.mdx")
                call PreloadEffect("war3mapImported\\a_new_skybigbang.mdx")
            endif
        endif
        if uid == 'H01L' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\minato_kunai.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl")
                call PreloadEffect("war3mapImported\\BlinkNew.mdl")
                call PreloadEffect("war3mapImported\\DTYellowNoring.mdl")
                call PreloadEffect("war3mapImported\\DT.mdl")
                call PreloadEffect("war3mapImported\\rasenganblast.mdl")
                call PreloadEffect("war3mapImported\\HelGate1.mdl")
                call PreloadEffect("war3mapImported\\kunaimark.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\lxw jhxcom_2000.mdl")
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl")
                call PreloadEffect("war3mapImported\\StarSlash(yellow).mdl")
                call PreloadEffect("war3mapImported\\[A]bloodex.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\WindCirclefaster.mdx")
                call PreloadEffect("war3mapimported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapimported\\[A]Flame Burst2.mdx")
                call PreloadEffect("war3mapimported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdx")
                call PreloadEffect("war3mapImported\\DTKuning.mdl")
                call PreloadEffect("war3mapImported\\EarthDetonation.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\wavejojo.mdl")
                call PreloadEffect("war3mapImported\\Almagest.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Minato2.mdl")
                call PreloadEffect("war3mapImported\\YellowSL.mdl")
                call PreloadEffect("war3mapImported\\AFB_shanguang5_1.mdl")
                call PreloadEffect("war3mapImported\\AZ_WSY_Misslie.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\MinatoRSG.mdl")
                call PreloadEffect("war3mapImported\\SBXZAFB2.mdl")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdl")
            endif
        endif
        if uid == 'H02V' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\ShockwavePurple.mdx")
                call PreloadEffect("war3mapImported\\Asuma-Explosion4.mdx")
                call PreloadEffect("war3mapImported\\DTPurpleNoRing.mdx")
                call PreloadEffect("war3mapImported\\A7_zisekuosan.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\LS SQTX.mdx")
                call PreloadEffect("war3mapImported\\PurpleExplode.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\BlackHoles.mdx")
                call PreloadEffect("war3mapImported\\ShockwavePurple.mdx")
                call PreloadEffect("war3mapImported\\Asuma-Explosion4.mdx")
                call PreloadEffect("war3mapImported\\a7_zisekuosan.mdx")
                call PreloadEffect("war3mapImported\\dtpurplenoring.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Kurumi Field.mdx")
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\Kurumi_Tokisaki.mdx")
                call PreloadEffect("war3mapImported\\[a]bloodex.mdx")
                call PreloadEffect("war3mapImported\\QQQQQR.mdx")
                call PreloadEffect("war3mapImported\\BloodEX-Special-2.mdx")
                call PreloadEffect("war3mapImported\\az-zidan.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\OrbitalRay.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\KurumiBall.mdx")
                call PreloadEffect("war3mapImported\\sjkjz.mdx")
            endif
        endif
        if uid == 'H042' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\fire-boom-new.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\XBurnerLight.mdx")
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapImported\\Asuma-Explosion.mdx")
                call PreloadEffect("war3mapImported\\SuperBigExplosion.mdx")
                call PreloadEffect("war3mapImported\\Abyssal_Impact_Base.mdx")
                call PreloadEffect("war3mapImported\\RedRing.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\BurningAxel.mdx")
                call PreloadEffect("war3mapImported\\NewDirtEXNofire.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\SolarBlast2.mdx")
                call PreloadEffect("war3mapImported\\PinkRedLaser.mdx")
                call PreloadEffect("war3mapImported\\blazingwind.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\BlackBlink.mdx")
                call PreloadEffect("war3mapImported\\Sawada.mdx")
                call PreloadEffect("war3mapImported\\dzxb1.mdx")
                call PreloadEffect("war3mapImported\\dzxb2.mdx")
                call PreloadEffect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdx")
                call PreloadEffect("war3mapImported\\Holy_Fire_Slam2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\Icestomp.mdx")
            endif
        endif
        if uid == 'H04M' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\Kizaru Magic.mdx")
                call PreloadEffect("war3mapimported\\LaserMissile.mdx")
                call PreloadEffect("war3mapimported\\wind2.mdx")
                call PreloadEffect("war3mapimported\\DustExplosion.mdx")
                call PreloadEffect("war3mapimported\\DustWaveNew.mdx")
                call PreloadEffect("war3mapimported\\Asuma-Explosion3.mdx")
                call PreloadEffect("war3mapimported\\EarthDetonation.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\BlinkCaster.mdl")
                call PreloadEffect("war3mapImported\\BlinkNew.mdl")
                call PreloadEffect("war3mapImported\\DivineRage.mdl")
                call PreloadEffect("war3mapImported\\NewDirtEXNofire.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\Kizaru.mdx")
                call PreloadEffect("war3mapimported\\HolySmiteMissileNew.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\FairyLawLight.mdl")
                call PreloadEffect("war3mapImported\\NuclearExplosion.mdl")
                call PreloadEffect("war3mapImported\\SuperBigExplosion.mdl")
                call PreloadEffect("war3mapImported\\ValkDust.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\!ylaser!2.mdx")
                call PreloadEffect("war3mapimported\\!guang small.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\laseryellow.mdl")
                call PreloadEffect("war3mapImported\\Abyssal_Impact_Base.mdl")
                call PreloadEffect("war3mapImported\\DTYellowNoring.mdl")
            endif
        endif
        if uid == 'H04R' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\iceflower.mdx")
                call PreloadEffect("war3mapImported\\FreezingRing.mdx")
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\HolyBlessing.mdl")
                call PreloadEffect("war3mapImported\\Icestomp.mdl")
                call PreloadEffect("war3mapImported\\Dead Spirit by Deckai2.mdl")
                call PreloadEffect("war3mapImported\\BlizzardEruption.mdl")
                call PreloadEffect("war3mapImported\\afbbxks.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\BlueCharge4.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\HarvestMana.mdl")
                call PreloadEffect("war3mapimported\\sbss_bingdongxili.mdx")
                call PreloadEffect("war3mapimported\\icefirst.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\BlueAsuma-Explosion.mdl")
                call PreloadEffect("war3mapImported\\Shockwave Blue.mdl")
                call PreloadEffect("war3mapimported\\effect_ReiatsuOverFlowbyDeckai.mdx")
            endif
        endif
        if uid == 'H046' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\white-qiquan-juhuang_red.mdl")
                call PreloadEffect("war3mapImported\\az_cocochristmas_d_impact_red.mdx")
                call PreloadEffect("war3mapImported\\xtyball.mdl")
                call PreloadEffect("war3mapimported\\W_Effect05.mdx")
                call PreloadEffect("war3mapimported\\bymutou_huozhu_siwang-red.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\white-qiquan-juhuang_yellow.mdx")
                call PreloadEffect("war3mapImported\\white-shandian-qiquan-yellow.mdx")
                call PreloadEffect("war3mapimported\\whiteslice_yellow.mdx")
                call PreloadEffect("war3mapimported\\RaitonAizen2.mdx")
                call PreloadEffect("war3mapimported\\az_cocochristmas_d_impact_yellow.mdx")
                call PreloadEffect("war3mapimported\\az_kaldr_blast_t2_yellow.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\[DoFT]chushou_by_wood_effect_huozhu_purple.mdx")
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]Kurohitsugib.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]blood132.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\[DoFT]twist.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]HadoDragon.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]AizenTEffect.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]DaoGuang_BaoZha_purple.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\DustWaveNew.mdx")
                call PreloadEffect("war3mapimported\\white-qiquan-juhuang.mdx")
                call PreloadEffect("war3mapimported\\Aizen_Form_squished.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]cf.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]dingzhi_by_wood_effect_blood_biaoxue_2.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]t_thunderclapcaster.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]az_hit-blue-blade.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\[DoFT]az_xuanfeng1.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]blinkcasterWhite.mdx")
            endif
        endif
        if uid == 'H02Q' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\iceflower.mdx")
                call PreloadEffect("war3mapImported\\BlizzardEruption.mdx")
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\Shockwave Blue.mdl")
                call PreloadEffect("war3mapImported\\BlackBlink.mdl")
                call PreloadEffect("war3mapImported\\FreezingRing.mdl")
                call PreloadEffect("war3mapImported\\Icestomp.mdl")
                call PreloadEffect("war3mapImported\\DT.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\ice-danmu.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect302.mdx")
                call PreloadEffect("war3mapimported\\afbbxks.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\[Plagiat]Effect153.mdl")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect312.mdl")
                call PreloadEffect("war3mapImported\\XZDL2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdl")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect373.mdl")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect568_2.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\[Plagiat]Effect309.mdl")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect392.mdl")
                call PreloadEffect("war3mapImported\\BlackBlink.mdl")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect249.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\Shockwave Blue.mdl")
                call PreloadEffect("war3mapImported\\Icestomp.mdl")
                call PreloadEffect("war3mapImported\\Fortress Death Classic.mdl")
                call PreloadEffect("war3mapImported\\sxbbtx2.mdl")
                call PreloadEffect("war3mapImported\\icefirst.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\sbss_bingdongxili.mdl")
            endif
        endif
        if uid == 'H063' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
                call PreloadEffect("war3mapImported\\Ephemeral Slash Orange.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
                call PreloadEffect("war3mapImported\\NanaSlash.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\kdls3.mdl")
                call PreloadEffect("war3mapImported\\FCJX_DG.mdl")
                call PreloadEffect("war3mapImported\\DGDDXZ4.mdl")
                call PreloadEffect("war3mapImported\\yydlz.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\exshexian5black.mdl")
                call PreloadEffect("war3mapImported\\exshexian5white.mdl")
                call PreloadEffect("war3mapImported\\zxd1.mdl")
                call PreloadEffect("war3mapImported\\zxd3.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\File00005641.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\kdls3.mdl")
                call PreloadEffect("war3mapImported\\jxpx.mdl")
                call PreloadEffect("war3mapImported\\tcc.mdl")
            endif
        endif
        if uid == 'H0A1' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BloodEX.mdx")
                call PreloadEffect("war3mapImported\\cyzblueXT.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\uissb.mdl")
                call PreloadEffect("war3mapImported\\DT112.mdl")
                call PreloadEffect("war3mapImported\\bluedashsfx.mdl")
                call PreloadEffect("war3mapImported\\shirouichigosl.mdl")
                call PreloadEffect("war3mapImported\\zxd1.mdl")
                call PreloadEffect("war3mapImported\\a_new_k3.mdl")
                call PreloadEffect("war3mapImported\\punchshot.mdl")
                call PreloadEffect("war3mapImported\\XZBlue.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\Berkablue.mdl")
                call PreloadEffect("war3mapimported\\Black.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\SlashOne.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\wavejojo.mdl")
                call PreloadEffect("war3mapImported\\EarthDetonation.mdl")
                call PreloadEffect("war3mapImported\\[A]Sand3.mdl")
                call PreloadEffect("war3mapImported\\eros.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl")
                call PreloadEffect("war3mapImported\\blue-daoguang-new.mdl")
                call PreloadEffect("war3mapImported\\[A]blue-qiliu-daoguang.mdl")
                call PreloadEffect("war3mapImported\\blue-toushewu.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\animeslashfinal.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
                call PreloadEffect("war3mapImported\\Kanzaki.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\slashdigital.mdl")
            endif
        endif
        if uid == 'H0B4' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\ShockwavePurple.mdx")
                call PreloadEffect("war3mapImported\\StarSlash(Missle).mdx")
                call PreloadEffect("war3mapImported\\DTPurpleNoRing.mdx")
                call PreloadEffect("war3mapImported\\energyburst.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\LotusStar.mdl")
                call PreloadEffect("war3mapImported\\superbigexplosion4_2.mdl")
                call PreloadEffect("war3mapImported\\File00002683.mdl")
                call PreloadEffect("war3mapImported\\PurpleExplode.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Dead Spirit by Deckai2.mdl")
                call PreloadEffect("war3mapImported\\supershinythingy4.mdl")
                call PreloadEffect("war3mapImported\\valkkame3.mdl")
                call PreloadEffect("war3mapImported\\slashdigital.mdl")
                call PreloadEffect("war3mapImported\\kirito_stbs01.mdl")
                call PreloadEffect("war3mapImported\\kirito_stbs03.mdl")
                call PreloadEffect("war3mapImported\\kirito_stbs04.mdl")
                call PreloadEffect("war3mapImported\\kirito_stbs05.mdl")
                call PreloadEffect("war3mapImported\\Shockwave Blue.mdl")
                call PreloadEffect("war3mapImported\\supershinythingy4.mdl")

                call PreloadEffect("war3mapImported\\BlueAncientExplode.mdl")
                call PreloadEffect("war3mapImported\\Energy Release2.mdl")
                call PreloadEffect("war3mapImported\\ArcaneExplosion.mdl")
                call PreloadEffect("war3mapImported\\Dead Spirit by Deckai2.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Purple Aura.mdl")
                call PreloadEffect("war3mapImported\\valkkame4.mdl")
                call PreloadEffect("war3mapImported\\violet spark by deckai.mdl")
                call PreloadEffect("war3mapImported\\BloodEX.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\dash sfx.mdl")
                call PreloadEffect("war3mapImported\\A7_zisekuosan.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\blacklotuswave.mdx")
                call PreloadEffect("war3mapimported\\ThunderBlackSpark.mdx")
                call PreloadEffect("war3mapimported\\Asuma-Explosion4.mdx")
            endif
        endif
        if uid == 'H0EG' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\WindNewFaw4.mdx")
                call PreloadEffect("war3mapimported\\WindCirclefaster.mdx")
                call PreloadEffect("war3mapimported\\Tohno.mdx")
                call PreloadEffect("war3mapImported\\kiritoslash.mdx")
                call PreloadEffect("war3mapimported\\qzzz.mdx")
                call PreloadEffect("war3mapimported\\tx_white2.mdx")
                call PreloadEffect("war3mapimported\\cleave.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\a_new_k3.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapimported\\afb214zj.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_Fgo_SuiPian_1_2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
                call PreloadEffect("war3mapimported\\zxd3.mdx")
                call PreloadEffect("war3mapimported\\zxd1.mdx")
                call PreloadEffect("war3mapimported\\zxd6.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapimported\\Ephemeral Cut Midnight.mdx")
                call PreloadEffect("war3mapimported\\FCJX_DG.mdx")
                call PreloadEffect("war3mapimported\\yishan2Red.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\SKSKSK2.mdx")
                call PreloadEffect("war3mapimported\\file00001557.mdx")
                call PreloadEffect("war3mapimported\\Kaca_Pecah.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\File00005641.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdx")
            endif
        endif
        if uid == 'H0FC' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\dash sfx.mdx")
                call PreloadEffect("war3mapimported\\qyddd.mdx")
                call PreloadEffect("war3mapimported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapimported\\wind2.mdx")
                call PreloadEffect("war3mapimported\\Hit.mdx")
                call PreloadEffect("war3mapimported\\WindExploreEffect(Bigger).mdx")
                call PreloadEffect("war3mapimported\\wavejojo.mdx")
                call PreloadEffect("war3mapimported\\Ultizoro.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\chongfeng2.mdl")
                call PreloadEffect("war3mapImported\\coarse slashRed.mdl")
                call PreloadEffect("war3mapImported\\BlackBlink.mdl")
                call PreloadEffect("war3mapImported\\slash red.mdl")
                call PreloadEffect("war3mapImported\\bloodp1.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\RedSlash2a.mdl")
                call PreloadEffect("war3mapImported\\[a]re2.mdl")
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapImported\\Ryougi.mdl")
                call PreloadEffect("war3mapImported\\blue-daoguagn3.mdl")
                call PreloadEffect("war3mapImported\\blue-daoguagn4.mdl")
                call PreloadEffect("war3mapImported\\blue-daoguagn2.mdl")
                call PreloadEffect("war3mapImported\\arcdirve02bbb.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\sakura round.mdx")
                call PreloadEffect("war3mapimported\\[A]qianbenying8.mdx")
                call PreloadEffect("war3mapimported\\BasicStrikeStar.mdx")
                call PreloadEffect("war3mapimported\\Akiha Claw sakura.mdx")
                call PreloadEffect("war3mapimported\\AncientExplode2.mdx")
                call PreloadEffect("war3mapimported\\PurpleExp.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\valkdustNew.mdx")
                call PreloadEffect("war3mapImported\\slash blue.mdx")
                call PreloadEffect("war3mapImported\\[A]devilslam.mdx")
                call PreloadEffect("war3mapImported\\fuzzystomp.mdx")
                call PreloadEffect("war3mapImported\\[A]sandpoff123.mdx")
                call PreloadEffect("war3mapImported\\cleave.mdx")
                call PreloadEffect("war3mapImported\\Slam-1.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\[a]slashdigital.mdx")
                call PreloadEffect("war3mapImported\\[A]slash3.mdx")
            endif
        endif
        if uid == 'H0CX' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\Holy_Fire_Slam2.mdx")
                call PreloadEffect("war3mapimported\\fire1.mdx")
                call PreloadEffect("war3mapimported\\[A]asuma-explosionAli.mdx")
                call PreloadEffect("war3mapimported\\[A]fire.mdx")
                call PreloadEffect("war3mapimported\\EarthDetonation.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\[a]explodeorange.mdx")
                call PreloadEffect("war3mapimported\\FireEruption2.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdx")
                call PreloadEffect("war3mapimported\\shuozhu2.mdx")
                call PreloadEffect("war3mapimported\\AlibabaMagicCircle.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\RedHarvest.mdx")
                call PreloadEffect("war3mapimported\\[A]Flame Burst2.mdx")
                call PreloadEffect("war3mapimported\\Aura2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\Amon.mdx")
                call PreloadEffect("war3mapimported\\magmaburst.mdx")
                call PreloadEffect("war3mapimported\\FireShockRun2.mdx")
                call PreloadEffect("war3mapimported\\az_tormentedsoul_t1.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdx")
                call PreloadEffect("war3mapimported\\AFB_dabaozha.mdx")
                call PreloadEffect("war3mapimported\\XZDL2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\[A]FireShockRun(fire2).mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\flames&smoke.mdx")
                call PreloadEffect("war3mapimported\\SuperBigExplosion2.mdx")
                call PreloadEffect("war3mapimported\\Firaga2.mdx")
                call PreloadEffect("war3mapimported\\shuozhu2.mdx")
            endif
        endif
        if uid == 'H011' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapImported\\dash sfx.mdx")
                call PreloadEffect("war3mapImported\\effect_alice01.mdx")
                call PreloadEffect("war3mapImported\\effect_alice08.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapimported\\a_new_k3.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapimported\\[A]blue-qiliu-daoguang_2.mdx")
                call PreloadEffect("war3mapimported\\Tanziro_Skill.mdx")
                call PreloadEffect("war3mapimported\\lb_hdg.mdx")
                call PreloadEffect("war3mapimported\\BloodEX-Special-2.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\blackblink.mdx")
                call PreloadEffect("war3mapimported\\effect_alice05.mdx")
                call PreloadEffect("war3mapimported\\[a]zoroef.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]az_pafeathermoon_b-orange.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect249.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\zygz.mdx")
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\reimuLS-yellow.mdx")
                call PreloadEffect("war3mapimported\\effect_alice04.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\moonwrath-yellow.mdx")
                call PreloadEffect("war3mapImported\\AliceBurstSFXbyvalk.mdx")
                call PreloadEffect("war3mapImported\\SFXBreakGround.mdx")
                call PreloadEffect("war3mapImported\\zxd2.mdx")
                call PreloadEffect("war3mapImported\\XZDL.mdx")
                call PreloadEffect("war3mapImported\\AliceSpinDustYellow.mdx")
                call PreloadEffect("war3mapImported\\AliceKameSFX3.mdx")
                call PreloadEffect("war3mapImported\\valkexp2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\hit-blood-special.mdl")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\az_hitheavy.mdl")
                call PreloadEffect("war3mapImported\\qqqqqr.mdl")
                call PreloadEffect("war3mapImported\\az-zidan.mdl")
                call PreloadEffect("war3mapimported\\AliceFSFX1.mdx")
                call PreloadEffect("war3mapimported\\AliceFSFX2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\oxgz-alice.mdx")
            endif
        endif
        if uid == 'H012' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdx")
                call PreloadEffect("war3mapimported\\blackblink.mdx")
                call PreloadEffect("war3mapimported\\earthdetonation.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect249.mdx")
                call PreloadEffect("war3mapimported\\[A]cherry blossom impact.mdx")
                call PreloadEffect("war3mapimported\\[A]sandpoff123.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\Dls1.mdx")
                call PreloadEffect("war3mapimported\\SBXZAFB2.mdx")
                call PreloadEffect("war3mapimported\\[A]Sand3.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\Tornado vino.mdx")
                call PreloadEffect("war3mapimported\\wind2.mdx")
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapimported\\SZBYAFB2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\Asuma-Explosion.mdx")
                call PreloadEffect("war3mapimported\\punchshot.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx")
                call PreloadEffect("war3mapimported\\Dustwavevin.mdx")
                call PreloadEffect("war3mapimported\\AgusWind.mdx")
                call PreloadEffect("war3mapimported\\[A]supershinythingyGon.mdx")
                call PreloadEffect("war3mapimported\\SuperBigExplosion2.mdx")
                call PreloadEffect("war3mapimported\\zxd1.mdx")
                call PreloadEffect("war3mapimported\\XZDL2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\valkdustnew.mdx")
                call PreloadEffect("war3mapimported\\dtkuning.mdx")
                call PreloadEffect("war3mapimported\\[A]GonFef.mdx")
                call PreloadEffect("war3mapimported\\[A]Natsu ef roar.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\XZDL.mdx")
                call PreloadEffect("war3mapimported\\az_tormentedsoul_t1.mdx")
            endif
        endif
        if uid == 'H0CY' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\TZJQ2.mdl")
                call PreloadEffect("war3mapimported\\afbwzntx.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\musashi.mdx")
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\TZJQ.mdx")
                call PreloadEffect("war3mapimported\\wzcfql.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\SZBYAFB2.mdx")
                call PreloadEffect("war3mapimported\\zxd3.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\Musashi2.mdx")
                call PreloadEffect("war3mapimported\\File00005641.mdx")
                call PreloadEffect("war3mapimported\\FCJX_DG.mdx")
                call PreloadEffect("war3mapimported\\zxd5.mdx")
            endif
        endif
        if uid == 'H0D1' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\Shockwave Blue.mdx")
                call PreloadEffect("war3mapimported\\fireshockrun1(blue).mdx")
                call PreloadEffect("war3mapimported\\[A]BlueRing.mdx")
                call PreloadEffect("war3mapimported\\Orgia Mode2.mdx")
                call PreloadEffect("war3mapimported\\[A]BlueAsuma-Explosion.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\ByakuranFireUlti2.mdx")
                call PreloadEffect("war3mapimported\\warpdarkcaster.mdx")
                call PreloadEffect("war3mapimported\\featherangel.mdx")
                call PreloadEffect("war3mapimported\\slash red.mdx")
                call PreloadEffect("war3mapimported\\e_basicstrike.mdx")
                call PreloadEffect("war3mapimported\\BloodP1.mdx")
                call PreloadEffect("war3mapimported\\[A]bloodex.mdx")
                call PreloadEffect("war3mapimported\\UltiZoro.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\bymutou-hongse3.mdx")
                call PreloadEffect("war3mapimported\\File00003933.mdx")
                call PreloadEffect("war3mapimported\\WindCirclefaster.mdx")
                call PreloadEffect("war3mapimported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapImported\\AZ_LCDark_T2_Buff.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapimported\\BlueNeutralBuildingExplosion.mdx")
                call PreloadEffect("war3mapimported\\Gukuboom.mdx")
                call PreloadEffect("war3mapImported\\[A]BlueAsuma-Explosion.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\[A]DarkBlast.mdx")
                call PreloadEffect("war3mapimported\\blackstrike.mdx")
                call PreloadEffect("war3mapimported\\[A]SuperBigExplosionBlack.mdx")
                call PreloadEffect("war3mapimported\\[A]Desecrate.mdx")
                call PreloadEffect("war3mapimported\\Gravitone.mdx")
                call PreloadEffect("war3mapimported\\[A]SuperBigExpBlackBlack.mdx")
                call PreloadEffect("war3mapimported\\[A]DevilSlamDark.mdx")
                call PreloadEffect("war3mapimported\\[A]blackbombb.mdx")
                call PreloadEffect("war3mapimported\\[A]SuperBigExpBlackLow.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\sakura round.mdx")
                call PreloadEffect("war3mapimported\\[A]qianbenying8.mdx")
                call PreloadEffect("war3mapimported\\[A]YX_niluhuaban.mdx")
                call PreloadEffect("war3mapimported\\BlueChakra.mdx")
                call PreloadEffect("war3mapImported\\az_hitheavy.mdl")
                call PreloadEffect("war3mapImported\\hit-juhuang-lizi.mdl")
                call PreloadEffect("war3mapImported\\effect2.mdl")
                call PreloadEffect("war3mapImported\\az_slb.mdl")
                call PreloadEffect("war3mapImported\\WindNewFaw4.mdl")
                call PreloadEffect("war3mapImported\\ChuShou_Effect_Earth1.mdl")

                call PreloadEffect("war3mapImported\\TZJQ2.mdl")
                call PreloadEffect("war3mapimported\\wzcfql.mdx")
                call PreloadEffect("war3mapimported\\[A]qianbenying8.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\red aura.mdx")
            endif
        endif
        if uid == 'H0CP' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\MC Wendy.mdl")
                call PreloadEffect("war3mapImported\\WeatherEffect5.mdl")
                call PreloadEffect("war3mapImported\\File000023201.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\MoonFireSlash.mdl")
                call PreloadEffect("war3mapImported\\BigExplosionBlue.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Cyclon Explosion.mdx")
                call PreloadEffect("war3mapImported\\WDFZL2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\az_airflowwEnd.mdl")
                call PreloadEffect("war3mapImported\\MC Wendy.mdl")
                call PreloadEffect("war3mapImported\\by_wood_effect_yuanbanlin_sand2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_3_0.mdl")
                call PreloadEffect("war3mapImported\\rasengan_eff4.mdl")
                call PreloadEffect("war3mapImported\\dingzhi_by_wood_effect_kuosanqiliu.mdl")
                call PreloadEffect("war3mapImported\\disruptor_e2.mdl")
                call PreloadEffect("war3mapImported\\kameha3.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\DT.mdl")
                call PreloadEffect("war3mapImported\\IceTornado.mdl")
                call PreloadEffect("war3mapImported\\Orgia Mode2.mdl")
                call PreloadEffect("war3mapImported\\File000023201.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\az_slb.mdl")
                call PreloadEffect("war3mapImported\\chongfeng2.mdl")
                call PreloadEffect("war3mapImported\\cf2.mdl")
                call PreloadEffect("war3mapImported\\by_wood_gongchengsipai_5.mdl")
            endif
        endif
        if uid == 'H0CQ' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\slash blue.mdx")
                call PreloadEffect("war3mapimported\\EnergyBurst.mdx")
                call PreloadEffect("war3mapimported\\dash sfx.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\wind2.mdx")
                call PreloadEffect("war3mapimported\\wavejojo.mdx")
                call PreloadEffect("war3mapimported\\chongfeng2.mdx")
                call PreloadEffect("war3mapimported\\[A]WhiteSlash.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\Nanaya.mdx")
                call PreloadEffect("war3mapimported\\eros.mdx")
                call PreloadEffect("war3mapimported\\arcdirve02b.mdx")
                call PreloadEffect("war3mapimported\\BloodP1.mdx")
                call PreloadEffect("war3mapimported\\zhanji-blue.mdx")
                call PreloadEffect("war3mapimported\\UltiZoro.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\devilslam.mdx")
                call PreloadEffect("war3mapimported\\qyddd.mdx")
                call PreloadEffect("war3mapimported\\Big_ICM_Blue.mdx")
                call PreloadEffect("war3mapimported\\[A]re1.mdx")
                call PreloadEffect("war3mapimported\\[A]mihawkslashhit.mdx")
                call PreloadEffect("war3mapimported\\bloodex1.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapImported\\shanguangbiubiu.mdl")
                call PreloadEffect("war3mapImported\\cyzblueXT.mdl")
                call PreloadEffect("war3mapimported\\xjbz.mdx")
                call PreloadEffect("war3mapimported\\AizenJHSY.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\nitu.mdx")
                call PreloadEffect("war3mapimported\\WindSlash.mdx")
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\BasicStrikeNanaya.mdx")
                call PreloadEffect("war3mapimported\\SKSKSK2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdx")
            endif
        endif
        if uid == 'H0CR' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\dash sfx.mdx")
                call PreloadEffect("war3mapimported\\Medaka Box Misogi Kumagawa Screw 2.mdx")
                call PreloadEffect("war3mapimported\\[A]blackbombb.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\dustwaveanimate2X.mdx")
                call PreloadEffect("war3mapimported\\SuperShinyThingy2.mdx")
                call PreloadEffect("war3mapimported\\[A]blackstrike.mdx")
                call PreloadEffect("war3mapimported\\[A]DarkBlast.mdx")
                call PreloadEffect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\[A]SuperBigExplosionBlack.mdx")
                call PreloadEffect("war3mapimported\\[A]DarkPulseMisogi.mdx")
                call PreloadEffect("war3mapimported\\[A]SuperBigExpBlackLow1.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\[A]DevilSlamDark.mdx")
                call PreloadEffect("war3mapimported\\[A]uberdarkwave.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\Medaka Box Misogi Kumagawa Screw 3.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\Medaka Box Misogi Kumagawa Screw 1.mdx")
                call PreloadEffect("war3mapimported\\[A]darkfog.mdx")
                call PreloadEffect("war3mapimported\\[A]SuperBigExpBlackLow.mdx")
            endif
        endif
        if uid == 'H0D4' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\rasengan_eff4.mdx")
                call PreloadEffect("war3mapimported\\CF2.mdx")
                call PreloadEffect("war3mapimported\\[A]AZ_chongci-blue.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\[A]n3s_o_target.mdx")
                call PreloadEffect("war3mapimported\\blue-slash-more.mdx")
                call PreloadEffect("war3mapimported\\daoguang.mdx")
                call PreloadEffect("war3mapimported\\File00000432.mdx")
                call PreloadEffect("war3mapimported\\[A]blue-shoot.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_6.mdx")
                call PreloadEffect("war3mapimported\\chongfeng2.mdx")
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\HakenSaber2.mdx")
                call PreloadEffect("war3mapimported\\[A]002_blue.mdx")

                call PreloadEffect("war3mapimported\\TealSlam.mdx")
                call PreloadEffect("war3mapimported\\az-blue-lizi-shangsheng.mdx")
                call PreloadEffect("war3mapimported\\blue-guangzhu-linghun.mdx")
                call PreloadEffect("war3mapimported\\[A]GongChengBlue.mdx")
                call PreloadEffect("war3mapimported\\[A]RinRfire.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\[A]RinRfire1.mdx")
                call PreloadEffect("war3mapImported\\hero_spiritbreaker_n3s_aghanim1.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\[A]ChuShou_Blue.mdx")
                call PreloadEffect("war3mapimported\\huoyantuci.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\[A]Rin_Lina_D1.mdx")
                call PreloadEffect("war3mapimported\\[A]AZ_chongci-blue.mdx")
                call PreloadEffect("war3mapimported\\[A]ChuShou_Blue1.mdx")
                call PreloadEffect("war3mapimported\\[A]RinRfire2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\[A]zise-lizi-tous.mdl")
                call PreloadEffect("war3mapImported\\buff_shenlan.mdl")
                call PreloadEffect("war3mapimported\\blue-zise-shousuo.mdx")
                call PreloadEffect("war3mapimported\\[A]az_goods_tp_target(3).mdx")
                call PreloadEffect("war3mapimported\\[A]boom-blue-zhendi.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Sand_YueKongJi.mdx")
                call PreloadEffect("war3mapimported\\[A]az-ice-zhendi.mdx")
                call PreloadEffect("war3mapimported\\[A]zhendi-water.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\daoguang-blue-hengsao.mdx")
                call PreloadEffect("war3mapimported\\AZ_PAFeathermoon_C_Caster.mdx")
                call PreloadEffect("war3mapimported\\File00000432.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx")
            endif
        endif
        if uid == 'H0D5' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\blackblink1.mdx")
                call PreloadEffect("war3mapimported\\WindNewFaw4.mdx")
                call PreloadEffect("war3mapimported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapimported\\WindCirclefaster.mdx")
                call PreloadEffect("war3mapimported\\File00001833.mdx")
                call PreloadEffect("war3mapimported\\az_slb.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\kaizokusfxbyvalk4.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx")
                call PreloadEffect("war3mapimported\\EffecthPush.mdx")
                call PreloadEffect("war3mapimported\\AZ_Jugg_E1.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\dustwaveanimate2X.mdx")
                call PreloadEffect("war3mapimported\\File00001831.mdx")
                call PreloadEffect("war3mapimported\\Hit.mdx")
                call PreloadEffect("war3mapimported\\EffecthPush.mdx")
                call PreloadEffect("war3mapimported\\AZ_Jugg_E1.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\lb_lfxq_da.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_6.mdx")
                call PreloadEffect("war3mapimported\\zhendi-sand.mdx")
                call PreloadEffect("war3mapimported\\[A]Sand3.mdx")
                call PreloadEffect("war3mapimported\\ChuShou_Effect_Earth1.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\ArrowSqwirl.mdx")
                call PreloadEffect("war3mapimported\\[A]hit-white-guangxiao.mdx")
                call PreloadEffect("war3mapimported\\icytouch.mdx")
                call PreloadEffect("war3mapimported\\qqqqqr.mdx")
                call PreloadEffect("war3mapimported\\az-zidan.mdx")
                call PreloadEffect("war3mapimported\\DioSlash.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\az_hitheavy.mdx")
                call PreloadEffect("war3mapimported\\luckmirror_lufeihandqian.mdx")
                call PreloadEffect("war3mapimported\\cronosphere.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\fire-boom-new.mdx")
                call PreloadEffect("war3mapimported\\[A]fire-zhendi-guangzhu.mdx")
                call PreloadEffect("war3mapimported\\FireEffectOrange.mdx")
                call PreloadEffect("war3mapimported\\[A]BY_Wood_Kong.mdx")
                call PreloadEffect("war3mapimported\\[A]FireEruption2.mdx")
            endif
        endif
        if uid == 'H0FX' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\DTBlueNoRingWhite.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\CF2.mdx")
                call PreloadEffect("war3mapimported\\laserpurple.mdx")
                call PreloadEffect("war3mapimported\\OrbitalRay.mdx")
                call PreloadEffect("war3mapimported\\EnergyBurst.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\WindNewFaw4.mdx")
                call PreloadEffect("war3mapimported\\WindCirclefaster.mdx")
                call PreloadEffect("war3mapimported\\kaizokusfxbyvalk4.mdx")
                call PreloadEffect("war3mapimported\\StarSlash(Missle).mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\LotusStar.mdx")
                call PreloadEffect("war3mapimported\\DTPurple.mdx")
                call PreloadEffect("war3mapimported\\ShockwavePurple.mdx")
                call PreloadEffect("war3mapimported\\blackblink1.mdx")
                call PreloadEffect("war3mapimported\\FreezingRing.mdx")
                call PreloadEffect("war3mapimported\\PinkBarrier.mdx")
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\by_wood_bashenan_juqi_1_4.mdx")
                call PreloadEffect("war3mapimported\\[A]ExpPurple.mdx")
                call PreloadEffect("war3mapimported\\Dls1.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\Lightningnova1.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\PurpleHeart.mdx")
                call PreloadEffect("war3mapimported\\dingzhi_by_wood_effect_kuosanqiliu.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\V.mdx")
                call PreloadEffect("war3mapimported\\!basicstrike!.mdx")
                call PreloadEffect("war3mapimported\\zxd3.mdx")
                call PreloadEffect("war3mapimported\\neptunering.mdx")
            endif
        endif
        if uid == 'H0G3' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\DarkBlast.mdx")
                call PreloadEffect("war3mapimported\\Desecrate.mdx")
                call PreloadEffect("war3mapimported\\Dead Spirit by Deckai3.mdx")
                call PreloadEffect("war3mapimported\\brs 1.mdx")
                call PreloadEffect("war3mapimported\\GajeelHoukou.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\ShadowDrive2.mdx")
                call PreloadEffect("war3mapimported\\akiha claw black.mdx")
                call PreloadEffect("war3mapimported\\DarkBlade.mdx")
                call PreloadEffect("war3mapimported\\AizenJHSY.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\ShadeAura.mdl")
                call PreloadEffect("war3mapimported\\ShadowDragonForce.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\dargonfoce.mdx")
                call PreloadEffect("war3mapimported\\DTBlueNoRingBlend.mdx")
                call PreloadEffect("war3mapimported\\WRing.mdx")
                call PreloadEffect("war3mapimported\\62.mdx")
                call PreloadEffect("war3mapimported\\bule-dark-salsh.mdx")
                call PreloadEffect("war3mapimported\\zhanji-pink-lizi.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei3.mdx")
                call PreloadEffect("war3mapimported\\RogueFTFL.mdx")
            endif
        endif
        if uid == 'H002' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\starslash(missle).mdx")
                call PreloadEffect("war3mapimported\\zxd3.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\sxcf2.mdx")
                call PreloadEffect("war3mapimported\\DGDDXZ4.mdx")
                call PreloadEffect("war3mapimported\\FCJX_DG.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\DTJJ.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\File00009632.mdx")
                call PreloadEffect("war3mapimported\\kiritoslash.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\jxlsxf.mdx")
                call PreloadEffect("war3mapimported\\TX_sltz_xiaoguo.mdx")
                call PreloadEffect("war3mapimported\\jxxz.mdx")
                call PreloadEffect("war3mapimported\\punchshot.mdx")
                call PreloadEffect("war3mapimported\\zhanji-bluex-shu2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\dash sfx.mdx")
                call PreloadEffect("war3mapImported\\xjbz.mdx")
                call PreloadEffect("war3mapImported\\AFBXZWD.mdx")
                call PreloadEffect("war3mapImported\\Dls2.mdx")
            endif
        endif
        if uid == 'H004' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl")
                call PreloadEffect("war3mapImported\\SatomiWind.mdl")
                call PreloadEffect("war3mapImported\\CF2.mdl")
                call PreloadEffect("war3mapImported\\star-magic.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
                call PreloadEffect("war3mapImported\\wind3.mdl")
                call PreloadEffect("war3mapImported\\zxd6.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\akiha_claw_blugreen.mdl")
                call PreloadEffect("war3mapImported\\akiha_claw_red.mdl")
                call PreloadEffect("war3mapImported\\lb_hdg.mdl")
                call PreloadEffect("war3mapImported\\WaveFxVert.mdl")
                call PreloadEffect("war3mapImported\\EarthSmash.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\RhoAias.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdl")
                call PreloadEffect("war3mapImported\\WaveFxVert.mdl")
                call PreloadEffect("war3mapImported\\remiliasq.mdl")
                call PreloadEffect("war3mapImported\\dtred.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdl")
                call PreloadEffect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl")
                call PreloadEffect("war3mapImported\\az_tormentedsoul_t1.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdl")
                call PreloadEffect("war3mapImported\\Dls1.mdl")
                call PreloadEffect("war3mapImported\\zxd1.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\BloodEX.mdl")
                call PreloadEffect("war3mapImported\\ToonBoomBlue.mdl")
                call PreloadEffect("war3mapImported\\LongSword.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\EX Light.mdl")
                call PreloadEffect("war3mapImported\\DTBlueNoRingWhite.mdl")
                call PreloadEffect("war3mapImported\\herosaber.mdl")
                call PreloadEffect("war3mapImported\\poweraura.mdl")
                call PreloadEffect("war3mapImported\\AncientExplodeOrange&Yellow.mdl")
            endif
        endif
        if uid == 'H005' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3_2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdx")
                call PreloadEffect("war3mapimported\\RasenganImpact.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapimported\\zxd1.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\djcjb.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl")
                call PreloadEffect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\AFB_shanguang6_1.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdx")
                call PreloadEffect("war3mapimported\\7dmrslj.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3_2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\7djw.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_1.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\jcnaruto7.mdx")
                call PreloadEffect("war3mapimported\\APblast2.mdx")
                call PreloadEffect("war3mapimported\\zxd1.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\OodamaRasenganNew.mdx")
                call PreloadEffect("war3mapimported\\BlinkCaster2.mdx")
                call PreloadEffect("war3mapimported\\Asuma-Explosion.mdx")
                call PreloadEffect("war3mapimported\\Abyssal_Impact_Base.mdx")
            endif
        endif
        if uid == 'H008' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\az_dg01.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\punchshot.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapimported\\xjbz.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\blackblink.mdx")
                call PreloadEffect("war3mapImported\\FCJX_DG.mdx")
                call PreloadEffect("war3mapImported\\DGDDXZ4.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\AizenJHSY.mdx")
                call PreloadEffect("war3mapimported\\zxd6.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\shirouichigosl.mdx")
            endif
        endif
        if uid == 'H00C' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\dash sfx.mdx")
                call PreloadEffect("war3mapimported\\BloodEX.mdx")
                call PreloadEffect("war3mapImported\\redslash2a.mdx")
                call PreloadEffect("war3mapImported\\zxd1.mdx")
                call PreloadEffect("war3mapImported\\BloodEX-Special-2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\punchshot.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapimported\\blood-rou.mdx")
                call PreloadEffect("war3mapimported\\xjbz.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\az_hit-red-blade.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\Levi.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\AZ_jingzi_jiansheng01_E1.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdl")
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\az_hitheavy.mdl")
                call PreloadEffect("war3mapImported\\hit-juhuang-lizi.mdl")
                call PreloadEffect("war3mapImported\\effect2.mdl")
                call PreloadEffect("war3mapImported\\AZ_hit-red.mdl")
                call PreloadEffect("war3mapImported\\UltiZoro.mdl")
                call PreloadEffect("war3mapImported\\red-zhendi-shanguang.mdl")

                call PreloadEffect("war3mapImported\\File00003933.mdl")
                call PreloadEffect("war3mapImported\\red-blood-ball.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl")
            endif
        endif
        if uid == 'H00H' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\wind3.mdl")
                call PreloadEffect("war3mapImported\\rasengan_eff4.mdl")
                call PreloadEffect("war3mapImported\\CF2.mdl")
                call PreloadEffect("war3mapImported\\2b_weapon.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\by_wood_effect_yuanbanlin_sand2.mdx")
                call PreloadEffect("war3mapimported\\HakenSaber2.mdx")
                call PreloadEffect("war3mapimported\\chongfeng2.mdx")
                call PreloadEffect("war3mapimported\\dash sfx.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_5.mdx")
                call PreloadEffect("war3mapimported\\DioSlash.mdx")
                call PreloadEffect("war3mapimported\\AZ_PAFeathermoon_C_Caster.mdx")
                call PreloadEffect("war3mapimported\\az-zidan.mdx")
                call PreloadEffect("war3mapimported\\qqqqqr.mdx")
                call PreloadEffect("war3mapimported\\az_hitheavy.mdx")

                call PreloadEffect("war3mapimported\\AZ_hit-red.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_6.mdx")
                call PreloadEffect("war3mapimported\\[A]Sand3.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\twd.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\dioword.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\nitu.mdx")
                call PreloadEffect("war3mapImported\\[A]Sand2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_2.mdx")
                call PreloadEffect("war3mapImported\\[A]sandpoff123.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]DioBoom.mdx")
                call PreloadEffect("war3mapImported\\by_wood_effect_yuzhiboyou_unusual_fenshendabaopo_2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\[A]NatsuFire2.mdx")
                call PreloadEffect("war3mapimported\\cronosphere.mdx")
                call PreloadEffect("war3mapimported\\az_pafeathermoon_b.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_YuanBanLin_Sand2.mdx")
                call PreloadEffect("war3mapimported\\blood-rou.mdx")
                call PreloadEffect("war3mapimported\\File00003933.mdx")
                call PreloadEffect("war3mapimported\\bloodex1.mdx")
                call PreloadEffect("war3mapimported\\[A]dustexplosion.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\File00000187.mdx")
                call PreloadEffect("war3mapimported\\az-blue-lizi-shangsheng.mdx")
                call PreloadEffect("war3mapimported\\File00003575.mdx")
            endif
        endif
        if uid == 'H00I' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\kdls2.mdx")
                call PreloadEffect("war3mapImported\\SBXZAFB2.mdx")
                call PreloadEffect("war3mapImported\\zxd2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\Dead Spirit by Deckai2.mdx")
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\afb214zj.mdx")
                call PreloadEffect("war3mapimported\\kdls2.mdx")
                call PreloadEffect("war3mapimported\\zxd3.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\kdls1.mdx")
                call PreloadEffect("war3mapImported\\bowen1.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\zxd2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\HakenSaber2.mdx")
                call PreloadEffect("war3mapImported\\File00002085.mdl")
                call PreloadEffect("war3mapImported\\File00002105.mdl")
                call PreloadEffect("war3mapImported\\36.mdl")
                call PreloadEffect("war3mapImported\\zm (280).mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\oxgz.mdx")
                call PreloadEffect("war3mapimported\\Chtholly.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei.mdx")
            endif
        endif
        if uid == 'H010' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\[a]devilslam.mdx")
                call PreloadEffect("war3mapImported\\glchj.mdx")
                call PreloadEffect("war3mapImported\\hakensaber2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\devilslam.mdx")
                call PreloadEffect("war3mapImported\\Chongfengnew.mdx")
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\ChargeBlue1.mdx")
                call PreloadEffect("war3mapImported\\daoguang.mdx")
                call PreloadEffect("war3mapImported\\Dead Spirit by Deckai2.mdx")
                call PreloadEffect("war3mapImported\\shunyihuoyan.mdx")
                call PreloadEffect("war3mapImported\\blue-slash-more.mdx")
                call PreloadEffect("war3mapImported\\[A]ZoroEf6.mdx")

                call PreloadEffect("war3mapImported\\[A]slashdigital.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\DarkLightningAura.mdx")
                call PreloadEffect("war3mapImported\\bowen1.mdx")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\hero_dwarvensniper_n3s_o_target.mdx")
                call PreloadEffect("war3mapImported\\daoguang-blue-hengsao.mdx")
                call PreloadEffect("war3mapImported\\blue-blink.mdx")
                call PreloadEffect("war3mapImported\\blue-toushewu.mdx")
                call PreloadEffect("war3mapImported\\BluefireBolt.mdx")
                call PreloadEffect("war3mapImported\\HelGate1.mdx")
                call PreloadEffect("war3mapImported\\by_wood_effect_yuanbanlin_sand2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapImported\\zhanji-blueX-shu2.mdx")
                call PreloadEffect("war3mapImported\\DT112.mdx")
                call PreloadEffect("war3mapImported\\uissb.mdx")
                call PreloadEffect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdx")
                call PreloadEffect("war3mapImported\\cleave.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\blueslash.mdx")
                call PreloadEffect("war3mapImported\\Dls1.mdx")
                call PreloadEffect("war3mapImported\\[A]Sand3.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\zxd3.mdx")
                call PreloadEffect("war3mapImported\\AFBWendyfeng.mdx")
                call PreloadEffect("war3mapImported\\[A]RinRfire2.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdx")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect392.mdx")
                call PreloadEffect("war3mapImported\\animeslashfinal.mdx")
                call PreloadEffect("war3mapImported\\AFB_hudie2.mdx")
                call PreloadEffect("war3mapImported\\afb214zj.mdx")

                call PreloadEffect("war3mapImported\\afbzd.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx")
                call PreloadEffect("war3mapImported\\ChuShou_Effect_Earth1.mdx")
                call PreloadEffect("war3mapImported\\[A]bloodex.mdx")
            endif
        endif
        if uid == 'H00J' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\dtred.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\DGDDXZ4.mdx")
                call PreloadEffect("war3mapimported\\bloodhit1.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\TZJQ5.mdx")
                call PreloadEffect("war3mapimported\\AZ_PA_B2.mdx")
                call PreloadEffect("war3mapimported\\Akame.mdx")
                call PreloadEffect("war3mapimported\\akamerdash.mdx")
                call PreloadEffect("war3mapimported\\AizenJHSY.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\HakenSaber2.mdx")
                call PreloadEffect("war3mapimported\\QQQQQR.mdx")
                call PreloadEffect("war3mapimported\\zxd6.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\a_new_k3.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\EarthDetonation.mdl")
                call PreloadEffect("war3mapImported\\[A]Sand3.mdl")
                call PreloadEffect("war3mapimported\\blood-rou.mdx")
                call PreloadEffect("war3mapimported\\File00003933.mdx")
                call PreloadEffect("war3mapimported\\bloodex1.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\nitu.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
                call PreloadEffect("war3mapImported\\Ephemeral Slash Orange.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx")
            endif
        endif
        if uid == 'H00K' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdx")
                call PreloadEffect("war3mapImported\\az_luanzhan_b.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapImported\\zxd3.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx")
                call PreloadEffect("war3mapImported\\kdls3.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapimported\\tx_white2.mdx")
                call PreloadEffect("war3mapimported\\AFBXZWD.mdx")
                call PreloadEffect("war3mapimported\\xjbz.mdx")
                call PreloadEffect("war3mapimported\\bluedashsfx.mdx")
                call PreloadEffect("war3mapimported\\CrescentSlashREd.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\twd2.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx")
                call PreloadEffect("war3mapimported\\Momo_devilslamita.mdx")
                call PreloadEffect("war3mapimported\\time-guanghuan.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl")
                call PreloadEffect("war3mapImported\\AZ_WSY_Misslie.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\zxd3.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\AizenJHSY.mdx")
                call PreloadEffect("war3mapImported\\xjbz.mdx")
                call PreloadEffect("war3mapImported\\renfujireal.mdx")
                call PreloadEffect("war3mapImported\\Momo_devilslamita.mdx")
            endif
        endif
        if uid == 'H00M' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\afbctzsntx.mdx")
                call PreloadEffect("war3mapImported\\glchj.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\3shadowassault(lightzi)waveblue.mdx")
                call PreloadEffect("war3mapimported\\tx-smoke1.mdx")
                call PreloadEffect("war3mapimported\\dash sfx.mdx")
                call PreloadEffect("war3mapimported\\valkdustNew.mdx")
                call PreloadEffect("war3mapimported\\windslash.mdx")
                call PreloadEffect("war3mapimported\\ultizoro.mdx")
                call PreloadEffect("war3mapimported\\windweak2.mdx")
                call PreloadEffect("war3mapimported\\xjbz.mdx")
                call PreloadEffect("war3mapimported\\xzblue.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\AizenJHSY.mdx")
                call PreloadEffect("war3mapimported\\zhanji-blue-shu.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapimported\\sxcf2.mdx")
                call PreloadEffect("war3mapimported\\[A]WhiteSlash.mdx")
                call PreloadEffect("war3mapimported\\ogitasoji.mdx")
                call PreloadEffect("war3mapimported\\Ephemeral Cut Midnight.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\CTshoting.mdx")
                call PreloadEffect("war3mapimported\\kdls2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx")
                call PreloadEffect("war3mapimported\\123 (383)_2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\zxd3.mdx")
                call PreloadEffect("war3mapimported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\valkdustNew.mdx")
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapImported\\blue-guagnzhu-special.mdl")
                call PreloadEffect("war3mapImported\\hit-blood-special.mdl")
                call PreloadEffect("war3mapImported\\jin xia.mdl")
                call PreloadEffect("war3mapImported\\red-blood-ball.mdl")

                call PreloadEffect("war3mapImported\\blood-rou.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\shanguangbiubiu.mdl")
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\wavejojo.mdx")
                call PreloadEffect("war3mapimported\\model (24).mdx")
                call PreloadEffect("war3mapImported\\0227.mdl")
                call PreloadEffect("war3mapImported\\3shadowassault(lightzi)waveblue.mdl")
                call PreloadEffect("war3mapImported\\[a]az-ice-zhendi.mdl")
                call PreloadEffect("war3mapimported\\[A]ChuShou_Blue1.mdx")
            endif
        endif
        if uid == 'H00R' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\0631.mdx")
                call PreloadEffect("war3mapImported\\3shadowassault(lightzi)waveblue.mdx")
                call PreloadEffect("war3mapImported\\zxd5.mdx")
                call PreloadEffect("war3mapImported\\NanaSlash.mdx")
                call PreloadEffect("war3mapImported\\kuroikki.mdx")
                call PreloadEffect("war3mapImported\\az_jianci.mdx")
                call PreloadEffect("war3mapImported\\glchj.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapimported\\a_new_k3.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapimported\\bowen1.mdx")
                call PreloadEffect("war3mapimported\\AFBXZWD.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_KOF_K_ReBanJi_YiZhiDan_2.mdx")
                call PreloadEffect("war3mapimported\\baojiang.mdx")
                call PreloadEffect("war3mapimported\\Valiant Charge Royal.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\MomijiThunder.mdx")
                call PreloadEffect("war3mapImported\\kuroikki.mdx")
                call PreloadEffect("war3mapImported\\xuanfeng_whitewind.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapimported\\az_airfloww11.mdx")
                call PreloadEffect("war3mapimported\\uissb.mdx")
                call PreloadEffect("war3mapimported\\windcirclefaster2.mdx")
                call PreloadEffect("war3mapimported\\YFtex1.mdx")
                call PreloadEffect("war3mapimported\\eros.mdx")
                call PreloadEffect("war3mapimported\\Kaca_Pecah.mdx")
                call PreloadEffect("war3mapimported\\zm (280).mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\yydlz.mdx")
                call PreloadEffect("war3mapimported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\az_red-xuanwo.mdx")
                call PreloadEffect("war3mapimported\\AZ_PA_B2.mdx")
                call PreloadEffect("war3mapimported\\SZBYAFB2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\BlackBlink.mdx")
                call PreloadEffect("war3mapImported\\icytouch.mdx")
                call PreloadEffect("war3mapImported\\Gukuboom.mdx")
                call PreloadEffect("war3mapImported\\File00005630.mdx")
                call PreloadEffect("war3mapImported\\File00002085.mdx")
                call PreloadEffect("war3mapImported\\FawEffects (3).mdx")
                call PreloadEffect("war3mapImported\\RasenganImpact.mdx")
                call PreloadEffect("war3mapImported\\File00009632.mdx")
            endif
        endif
        if uid == 'H00N' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\magmablast2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapimported\\a_new_k3.mdx")
                call PreloadEffect("war3mapimported\\punchshot.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapimported\\magmaburst.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\BreathOfFireMissile.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\by_wood_effect_yuzhiboyou_unusual_fenshendabaopo_2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\firessl.mdx")
                call PreloadEffect("war3mapimported\\firebbic.mdx")
            endif
        endif
        if uid == 'H00X' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\blackblink.mdx")
                call PreloadEffect("war3mapimported\\NanaSlash.mdx")
                call PreloadEffect("war3mapimported\\File00010078.mdx")
                call PreloadEffect("war3mapimported\\WindCirclefaster.mdx")
                call PreloadEffect("war3mapimported\\tx_white1.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\tx-smoke1.mdx")
                call PreloadEffect("war3mapimported\\SlashCRITLOW.mdx")
                call PreloadEffect("war3mapimported\\VergilSlashes.mdx")
                call PreloadEffect("war3mapimported\\File00009632.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_1.mdl")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx")
                call PreloadEffect("war3mapImported\\WindCircleFaster.mdl")
                call PreloadEffect("war3mapimported\\SKSKSK1.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\Ephemeral Cut Midnight.mdx")
                call PreloadEffect("war3mapimported\\123 (383)_2.mdx")
                call PreloadEffect("war3mapimported\\xjbz.mdx")
            endif
        endif
        if uid == 'H01Z' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\Artillery.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdx")
                call PreloadEffect("war3mapimported\\[A]BY_Wood_FenShenDaBaoPo_2.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\az_hysbd.mdx")
                call PreloadEffect("war3mapimported\\flamestrike i.mdx")
                call PreloadEffect("war3mapimported\\rasenganodama.mdx")
                call PreloadEffect("war3mapimported\\Sprint_Cast_Base.mdx")
                call PreloadEffect("war3mapimported\\supershinythingypurple.mdx")
                call PreloadEffect("war3mapimported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapimported\\BlackHoleSSS.mdx")
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\GilgameshCircle.mdx")
                call PreloadEffect("war3mapimported\\kiana_spears.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\Kiana.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\[DoFT]Kurohitsugib.mdx")
                call PreloadEffect("war3mapimported\\model (117)_2.mdx")
                call PreloadEffect("war3mapimported\\model (103)_2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapimported\\az_tormentedsoul_t1.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\Chain2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Decade_RiderKick_Explode.mdx")
            endif
        endif
        if uid == 'H014' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\PinoEffect1.mdx")
                call PreloadEffect("war3mapimported\\tx-smoke1.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\DTJJ.mdx")
                call PreloadEffect("war3mapimported\\bossbirth.mdx")
                call PreloadEffect("war3mapimported\\Knife1.mdx")
                call PreloadEffect("war3mapimported\\DustWindFasterExact.mdx")
                call PreloadEffect("war3mapimported\\bloodslash.mdx")
                call PreloadEffect("war3mapimported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdx")
                call PreloadEffect("war3mapimported\\Dls1.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdx")
                call PreloadEffect("war3mapImported\\blackblink.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\PinoEffect2.mdx")
                call PreloadEffect("war3mapimported\\MomijiThunder_red.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\UwU2.mdx")
                call PreloadEffect("war3mapimported\\UwU5.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\az_coco_t2.mdx")
                call PreloadEffect("war3mapimported\\model (349).mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect43.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\[DoFT]DevilSlamAddetivRed.mdx")
            endif
        endif
        if uid == 'H09Y' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\VoidDrown.mdx")
                call PreloadEffect("war3mapImported\\PurpleExplode.mdx")
                call PreloadEffect("war3mapImported\\A7_zisekuosan.mdx")
                call PreloadEffect("war3mapImported\\ShockwavePurple.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\Dead Spirit by Deckai3.mdx")
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\Asuma-Explosion4.mdx")
                call PreloadEffect("war3mapimported\\DarkNova.mdx")
                call PreloadEffect("war3mapImported\\bymutou-hongse3-purple.mdx")
                call PreloadEffect("war3mapimported\\[A]blue-shoot.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\cursebolt.mdx")
                call PreloadEffect("war3mapimported\\windcaotic2.mdx")
                call PreloadEffect("war3mapImported\\sfeidao.mdx")
                call PreloadEffect("war3mapimported\\buff_bai-red.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\Evolt-7.mdx")
                call PreloadEffect("war3mapimported\\PurpleShield.mdx")
                call PreloadEffect("war3mapimported\\BlackHoleOt.mdx")
                call PreloadEffect("war3mapimported\\windcaotic3.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\dustwaveanimate2.mdx")
                call PreloadEffect("war3mapImported\\Starlight Charge.mdx")
                call PreloadEffect("war3mapImported\\scjj.mdx")
                call PreloadEffect("war3mapImported\\moonwrath-purple.mdx")
                call PreloadEffect("war3mapImported\\baise-magic-shousuo_purple.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\az_blacksmoke.mdx")
                call PreloadEffect("war3mapimported\\NanohaMidchilderDivine.mdx")
                call PreloadEffect("war3mapimported\\Evolt-1.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_LuoLei-purp.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Sand_TieShaZhongJi_ZhaKai.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_ZhenZhengDeLuoLei-purp.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\Evolt-1_new.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]PurpleAz-hit.mdx")
                call PreloadEffect("war3mapimported\\FadeSpearPurple.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]az-zise-toushewu.mdx")
            endif
        endif
        if uid == 'H0CZ' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\uissb.mdx")
                call PreloadEffect("war3mapimported\\fireleaf.mdx")
                call PreloadEffect("war3mapimported\\FireEruption2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\dash sfx.mdx")
                call PreloadEffect("war3mapimported\\CF2.mdx")
                call PreloadEffect("war3mapimported\\chongfeng2.mdx")
                call PreloadEffect("war3mapimported\\hiteffect07bluea.mdx")
                call PreloadEffect("war3mapimported\\daoguang-blue-hengsao.mdx")
                call PreloadEffect("war3mapimported\\QQQQQR.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\zhendi-yellow-qiquan-stone.mdx")
                call PreloadEffect("war3mapimported\\blue-slash-more.mdx")
                call PreloadEffect("war3mapImported\\EffecktChidori.mdx")

                call PreloadEffect("war3mapImported\\SuperShinyThingy2.mdx")
                call PreloadEffect("war3mapimported\\cronosphere.mdx")
                call PreloadEffect("war3mapimported\\star-magic.mdx")
                call PreloadEffect("war3mapimported\\blue-toushewu.mdx")
                call PreloadEffect("war3mapimported\\shandian-xiaoshi-man-2.mdx")
                call PreloadEffect("war3mapimported\\[A]blue--zhendi3.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\rasengan_eff4.mdx")
                call PreloadEffect("war3mapimported\\[a]t_icesparks.mdx")
                call PreloadEffect("war3mapimported\\az-zidan.mdx")
                call PreloadEffect("war3mapimported\\blue-daoguang-new.mdx")
                call PreloadEffect("war3mapimported\\hero_dwarvensniper_n3s_o_target.mdx")
                call PreloadEffect("war3mapimported\\bymutou_huozhu_heise.mdx")
                call PreloadEffect("war3mapimported\\bymutou_huozhu_siwang.mdx")
                call PreloadEffect("war3mapimported\\[A]dz2.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]AmaterasNew.mdx")
                call PreloadEffect("war3mapimported\\AmaterExplosion1.mdx")

                call PreloadEffect("war3mapimported\\[A]ama boom.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\File00000432.mdx")
                call PreloadEffect("war3mapimported\\StarSlashNew.mdx")
                call PreloadEffect("war3mapimported\\hiteffect10white.mdx")
                call PreloadEffect("war3mapimported\\lighwave1.mdx")
                call PreloadEffect("war3mapimported\\[A]misaka lightBlue.mdx")
                call PreloadEffect("war3mapimported\\tx_white1.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]Chibaku.mdx")
                call PreloadEffect("war3mapimported\\AZ_Goods_Dagon_Target(3).mdx")
                call PreloadEffect("war3mapimported\\blue-guangzhu-linghun.mdx")
                call PreloadEffect("war3mapimported\\ErosBluePurple.mdx")

                call PreloadEffect("war3mapimported\\[A]pundun!-.mdx")
                call PreloadEffect("war3mapimported\\AZ_Goods_Dagon_Target(3).mdx")
                call PreloadEffect("war3mapimported\\slam09.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_1.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\nitu.mdx")
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\TX_sltz_xiaoguo2.mdx")
                call PreloadEffect("war3mapimported\\XZDL.mdx")
            endif
        endif
        if uid == 'H0D0' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\zygz.mdx")
                call PreloadEffect("war3mapimported\\[A]BY_Wood_FenShenDaBaoPo_2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\mbdm2.mdx")
                call PreloadEffect("war3mapimported\\by_wood_effect_yuzhiboyou_unusual_fenshendabaopo_2.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\Magic Cast.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\skymgs.mdx")
                call PreloadEffect("war3mapimported\\grandchariotmissile.mdx")
                call PreloadEffect("war3mapimported\\az_tormentedsoul_t1.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\az_blacksmoke.mdx")
                call PreloadEffect("war3mapimported\\firesphere.mdx")
                call PreloadEffect("war3mapimported\\holylightred.mdx")
                call PreloadEffect("war3mapimported\\lightingspark.mdx")
                call PreloadEffect("war3mapimported\\AZ_WSY_Misslie.mdx")
                call PreloadEffect("war3mapimported\\SuperBigExplosion2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\[Plagiat]Effect105.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect42.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect81.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect569.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect41.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect43.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect45.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect82.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect83.mdx")

                call PreloadEffect("war3mapimported\\[Plagiat]Effect77.mdx")
                call PreloadEffect("war3mapimported\\[Plagiat]Effect78.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\Shadow_Glow.mdx")
                call PreloadEffect("war3mapimported\\mcj.mdx")
                call PreloadEffect("war3mapimported\\SuperShinyThingy2_1.mdx")
                call PreloadEffect("war3mapimported\\SuperShinyThingyBlack.mdx")
                call PreloadEffect("war3mapimported\\SuperBigExplosion4_1.mdx")
                call PreloadEffect("war3mapimported\\DustWaveAnimate2.mdx")
            endif
        endif
        if uid == 'H0D2' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\AZ_Z020_3.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\zygz.mdx")
                call PreloadEffect("war3mapimported\\Black.mdx")
                call PreloadEffect("war3mapimported\\pinkghj.mdx")
                call PreloadEffect("war3mapimported\\zxd3.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\Dark Magic.mdx")
                call PreloadEffect("war3mapimported\\sjkjz.mdx")
                call PreloadEffect("war3mapimported\\az_tormentedsoul_t1.mdx")
                call PreloadEffect("war3mapimported\\az_airfloww12.mdx")
                call PreloadEffect("war3mapimported\\obelisk.mdx")
                call PreloadEffect("war3mapimported\\misaka light a.mdx")
                call PreloadEffect("war3mapimported\\earthdetonation.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_ZhenZhengDeLuoLei-purp.mdx")
                call PreloadEffect("war3mapimported\\Dls1.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\SkyDragon.mdx")
                call PreloadEffect("war3mapimported\\oxgz.mdx")
                call PreloadEffect("war3mapimported\\plasma+zanber+lightning.mdx")
                call PreloadEffect("war3mapimported\\hhzy123.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\hehehehehe33.mdx")
                call PreloadEffect("war3mapimported\\demon.mdx")
                call PreloadEffect("war3mapimported\\ethereal lightning2.mdx")
                call PreloadEffect("war3mapimported\\dianqiu.mdx")
                call PreloadEffect("war3mapimported\\misaka light b.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\exodia.mdx")
                call PreloadEffect("war3mapimported\\AZ_Rune31.mdx")
                call PreloadEffect("war3mapimported\\SZBYAFB2.mdx")
                call PreloadEffect("war3mapimported\\by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong.mdx")
                call PreloadEffect("war3mapimported\\kuriboh_compressed.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdx")
                call PreloadEffect("war3mapimported\\WindExploreEffect(Bigger).mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Sand_YueKongJi.mdx")
                call PreloadEffect("war3mapimported\\by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdx")
            endif
        endif
        if uid == 'H03E' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\File00005630.mdl")
                call PreloadEffect("war3mapImported\\FantasyBattle (1582).mdl")
                call PreloadEffect("war3mapImported\\0631.mdl")
                call PreloadEffect("war3mapImported\\FantasyBattle (1520).mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\File00005630.mdl")
                call PreloadEffect("war3mapImported\\1062.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\0614.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\0227.mdl")
                call PreloadEffect("war3mapImported\\BD_YEQI03.mdl")
                call PreloadEffect("war3mapImported\\File00000012.mdl")
                call PreloadEffect("war3mapImported\\zm (280).mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\fanty (86).mdl")
                call PreloadEffect("war3mapImported\\0810.mdl")
                call PreloadEffect("war3mapImported\\File00002384.mdl")
                call PreloadEffect("war3mapImported\\FantasyBattle (1643).mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\0203.mdl")
                call PreloadEffect("war3mapImported\\File00002085.mdl")
                call PreloadEffect("war3mapImported\\File00002105.mdl")
                call PreloadEffect("war3mapImported\\36.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\kaizokusfxbyvalk4.mdl")
                call PreloadEffect("war3mapImported\\HelGate1.mdl")
                call PreloadEffect("war3mapImported\\Cleave.mdl")
                call PreloadEffect("war3mapImported\\SBXZAFB2.mdl")
            endif
        endif
        if uid == 'H05Z' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\fire-boom-newGreen.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_KOF_K_ReBanJi_YiZhiDan_2.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\ltccc.mdl")
                call PreloadEffect("war3mapImported\\sistinatoushe.mdl")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdl")
                call PreloadEffect("war3mapImported\\afbzd.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl")
                call PreloadEffect("war3mapImported\\zxd6.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_2.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl")
                call PreloadEffect("war3mapImported\\SBXZAFB2.mdl")
                call PreloadEffect("war3mapImported\\Dls1.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\TX_25white first.mdl")
                call PreloadEffect("war3mapImported\\ltszmt.mdl")
                call PreloadEffect("war3mapImported\\az_pafeathermoon_c_caster.mdl")
                call PreloadEffect("war3mapImported\\afbzd.mdl")
                call PreloadEffect("war3mapImported\\ltccc.mdl")
                call PreloadEffect("war3mapImported\\Midoliyasd.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Decade_RiderKick_Explode.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\bluedashsfx.mdl")
                call PreloadEffect("war3mapImported\\afbltjz.mdl")
                call PreloadEffect("war3mapImported\\zxd3.mdl")
                call PreloadEffect("war3mapImported\\glchj.mdl")
                call PreloadEffect("war3mapImported\\AFB_LTSD.mdl")
                call PreloadEffect("war3mapImported\\CronusEffectGreen.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl")
                call PreloadEffect("war3mapImported\\Chongfengnew.mdl")
            endif
        endif
        if uid == 'H0CV' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\Reimu_FZ.mdl")
                call PreloadEffect("war3mapImported\\cursebolt1.mdl")
                call PreloadEffect("war3mapImported\\Asuma-Explosion4.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\[DoFT]DevilSlamAddetivRed.mdl")
                call PreloadEffect("war3mapImported\\dash sfx.mdl")
                call PreloadEffect("war3mapImported\\SuperBigBombExplosionRed.mdl")
                call PreloadEffect("war3mapImported\\SuperShinyThingy5.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\reimuLS.mdl")
                call PreloadEffect("war3mapImported\\Ethereal Lightning.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\mengxtsq.mdl")
                call PreloadEffect("war3mapImported\\mengxts.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\reimuyuzha.mdl")
                call PreloadEffect("war3mapImported\\spiritarrow_pink.mdl")
            endif
        endif
        if uid == 'H006' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\zxd1.mdl")
                call PreloadEffect("war3mapImported\\blizzard.mdl")
                call PreloadEffect("war3mapImported\\effect_IRui03.mdl")
                call PreloadEffect("war3mapImported\\afbbxks.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\miku.mdl")
                call PreloadEffect("war3mapImported\\blueaftershock.mdl")
                call PreloadEffect("war3mapImported\\effect_IRui02.mdl")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdl")
                call PreloadEffect("war3mapImported\\62.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\AOE2m.mdl")
                call PreloadEffect("war3mapImported\\Blizzard II Missile.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\ShadeAura.mdl")
                call PreloadEffect("war3mapImported\\DarknessRising2.mdl")
                call PreloadEffect("war3mapImported\\SandAura.mdl")
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\Absolute Zero.mdl")
                call PreloadEffect("war3mapImported\\sbss_bingdongxili.mdl")
                call PreloadEffect("war3mapImported\\Drop_the_beat.mdl")
            endif
        endif
        if uid == 'H0FY' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\AFBBXKS.mdx")
                call PreloadEffect("war3mapimported\\BFH.mdx")
                call PreloadEffect("war3mapimported\\bkks.mdx")
                call PreloadEffect("war3mapimported\\sbss_bingdongxili.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\Kuzan.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\icefirst.mdx")
                call PreloadEffect("war3mapimported\\AquaSpike.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\AFBBXKS.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\sxbbtx1.mdx")
            endif
        endif
        if uid == 'H0G0' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\Dota_Effect_lina_longpozhan.mdx")
                call PreloadEffect("war3mapimported\\firebbic.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\blackblink1.mdl")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdl")
                call PreloadEffect("war3mapImported\\wavejojo.mdl")
                call PreloadEffect("war3mapImported\\NanaSlash.mdl")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\s_RunningFlame Aura.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\bluedashsfx.mdx")
                call PreloadEffect("war3mapimported\\afbxnntx.mdx")
                call PreloadEffect("war3mapimported\\zxd3.mdx")
                call PreloadEffect("war3mapimported\\AFBXZWD.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\sxcf.mdl")
                call PreloadEffect("war3mapImported\\LW11.mdl")
                call PreloadEffect("war3mapImported\\asuma-explosion.mdl")
                call PreloadEffect("war3mapImported\\fireleaf.mdl")
                call PreloadEffect("war3mapImported\\firessl.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\zunt.mdx")
                call PreloadEffect("war3mapimported\\black.mdx")
                call PreloadEffect("war3mapimported\\AFB_dabaozha.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\SunStrikeImpact2.mdl")
                call PreloadEffect("war3mapImported\\TenpaJyousaifxbyDeckai.mdl")
            endif
        endif
        if uid == 'H0G1' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\ice-danmu.mdx")
                call PreloadEffect("war3mapImported\\AFBBXKS.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\tx012a.mdl")
                call PreloadEffect("war3mapImported\\bingk.mdl")
                call PreloadEffect("war3mapImported\\[Effect]534.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\hitsugayabfardragonline.mdl")
                call PreloadEffect("war3mapImported\\az_cocochristmas_d_impact.mdl")
                call PreloadEffect("war3mapImported\\az_nevermoreice_x.mdl")
                call PreloadEffect("war3mapImported\\blueauralance.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\ice_snow_inc.mdl")
                call PreloadEffect("war3mapImported\\icestolb.mdl")
                call PreloadEffect("war3mapImported\\thunderclapcaster3.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\icefirst.mdl")
                call PreloadEffect("war3mapImported\\sbss_bingdongxili.mdl")
                call PreloadEffect("war3mapImported\\icestomp.mdl")
                call PreloadEffect("war3mapImported\\sxbbtx2.mdl")
            endif
        endif
        if uid == 'H015' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdl")
                call PreloadEffect("war3mapImported\\blackblink.mdl")
                call PreloadEffect("war3mapImported\\kdls2.mdl")
                call PreloadEffect("war3mapImported\\dingzhi_by_wood_effect_kuosanqiliu.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\tx-smoke1.mdl")
                call PreloadEffect("war3mapImported\\SlashCRITLOW.mdl")
                call PreloadEffect("war3mapImported\\VergilSlashes.mdl")
                call PreloadEffect("war3mapImported\\File00010078.mdl")
                call PreloadEffect("war3mapImported\\ZK-Knife light1_2.mdl")
                call PreloadEffect("war3mapImported\\model (24).mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\bingk.mdl")
                call PreloadEffect("war3mapImported\\[A]zhendi-water.mdl")
                call PreloadEffect("war3mapImported\\az_nevermoreice_x.mdl")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect373.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\OmaShu.mdl")
                call PreloadEffect("war3mapImported\\BD_YEQI03.mdl")
                call PreloadEffect("AshuraAura.mdl")
                call PreloadEffect("war3mapImported\\UDeathBlu.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\wavejojo.mdl")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect568_2.mdl")
            endif
        endif
        if uid == 'H001' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\Ephemeral Slash Orange.mdx")
                call PreloadEffect("war3mapImported\\SlashCRITLOW.mdx")
                call PreloadEffect("war3mapImported\\File00002084.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\TX_qiang32(2).mdx")
                call PreloadEffect("war3mapimported\\tx-smoke1.mdx")
                call PreloadEffect("war3mapimported\\File00006271.mdx")
                call PreloadEffect("war3mapImported\\File00002084.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\File00002368.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Mr.War3_JSSTZS.mdx")
                call PreloadEffect("war3mapImported\\File00009632.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\AZ_shawang03_L3.mdx")
                call PreloadEffect("war3mapImported\\File00003016.mdx")
                call PreloadEffect("war3mapImported\\Vergil-8.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\bossbirth.mdx")
                call PreloadEffect("war3mapImported\\0454.mdx")
                call PreloadEffect("war3mapImported\\spacequake.mdx")
            endif
        endif
        if uid == 'H007' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\ArcaneMissileComplete.mdx")
                call PreloadEffect("war3mapImported\\DTPurple.mdx")
                call PreloadEffect("war3mapImported\\Abyssal_Impact_Base.mdx")
                call PreloadEffect("war3mapImported\\OrbitalRay.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\skymgs.mdx")
                call PreloadEffect("war3mapimported\\SkyRing.mdx")
                call PreloadEffect("war3mapimported\\SkyBomb.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\Magic Cast.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Staff1.mdx")
                call PreloadEffect("war3mapImported\\Staff2.mdx")
                call PreloadEffect("war3mapImported\\Staff3.mdx")
                call PreloadEffect("war3mapImported\\Staff4.mdx")
                call PreloadEffect("war3mapImported\\Staff5.mdx")
                call PreloadEffect("war3mapImported\\blue--zhendi.mdx")
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapImported\\AZ_UV.mdl")
                call PreloadEffect("war3mapImported\\MC Laxus.mdl")
                call PreloadEffect("war3mapImported\\mystoganauraa.mdl")
                call PreloadEffect("war3mapImported\\OrbitalRay.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\mindfog_2.mdl")
                call PreloadEffect("war3mapImported\\hehehehehe33.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\OrbitalRay.mdx")
                call PreloadEffect("war3mapimported\\Almagest.mdx")
                call PreloadEffect("war3mapimported\\SuperShinyThingy33.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapimported\\bloodex.mdx")
                call PreloadEffect("war3mapimported\\zxd6.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\by_wood_effect_yuzhiboyou_unusual_fenshendabaopo_2.mdx")
                call PreloadEffect("war3mapimported\\mbdm2.mdx")
            endif
        endif
        if uid == 'H00B' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_LeiJiZhiQing.mdx")
                call PreloadEffect("war3mapImported\\MomijiThunder.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\lightnings long.mdx")
                call PreloadEffect("war3mapimported\\zxd5.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Cyclone.mdx")
                call PreloadEffect("war3mapImported\\shadowtornado2.mdx")
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_ChaoDianCiPao.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\cronosphere.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\KamaFlower2.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_LuoLei.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Sand_TieShaZhongJi_ZhaKai.mdx")
            endif
        endif
        if uid == 'H00E' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdl")
                call PreloadEffect("war3mapImported\\afbxnntx.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\Dead Spirit by Deckai3.mdx")
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\kdls3.mdx")
                call PreloadEffect("war3mapimported\\zxd3.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\zxd1.mdx")
                call PreloadEffect("war3mapimported\\anspdbb.mdx")
                call PreloadEffect("war3mapimported\\asyjdb.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_YueYun_1.mdx")
                call PreloadEffect("war3mapImported\\asknhq.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2_2.mdx")
                call PreloadEffect("war3mapimported\\anssd2.mdx")
            endif
        endif
        if uid == 'H00G' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\zxd3.mdx")
                call PreloadEffect("war3mapimported\\glchj.mdx")
                call PreloadEffect("war3mapimported\\zxd5.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\zxd6.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\uissb.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\Black.mdl")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
            endif
        endif
        if uid == 'H00Q' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\AZ_LCDark_W1.mdx")
                call PreloadEffect("war3mapImported\\AZ_Slark_D2.mdx")
                call PreloadEffect("war3mapImported\\26.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Ethereal Lightning.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\wind4.mdx")
                call PreloadEffect("war3mapImported\\HakenSaber2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\flames&smoke.mdx")
                call PreloadEffect("war3mapImported\\Asuma-Explosion.mdx")
                call PreloadEffect("war3mapImported\\SuperBigExplosion.mdx")
                call PreloadEffect("war3mapImported\\Abyssal_Impact_Base.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\blackblink.mdx")
            endif
        endif
        if uid == 'H00U' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\wind4.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\rasengan_eff4.mdx")
                call PreloadEffect("war3mapimported\\CF2.mdx")
                call PreloadEffect("war3mapimported\\fireshockrun1(purple).mdx")
                call PreloadEffect("war3mapimported\\NDEarthWave.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\utsuhoredsun.mdl")
                call PreloadEffect("war3mapImported\\Abyssal_Impact_Base.mdl")
                call PreloadEffect("war3mapImported\\Asuma-Explosion.mdl")
                call PreloadEffect("war3mapImported\\DustWave.mdl")
                call PreloadEffect("war3mapImported\\NewDirtEXNofire.mdl")
                call PreloadEffect("war3mapImported\\NuclearExplosion.mdl")
                call PreloadEffect("war3mapImported\\SuperBigExplosion.mdl")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\ShockwavePurple.mdl")
                call PreloadEffect("war3mapImported\\LotusStar.mdl")
                call PreloadEffect("war3mapImported\\Tohkawave.mdl")
                call PreloadEffect("war3mapImported\\DarkBlast.mdl")
                call PreloadEffect("war3mapImported\\AncientExplode2.mdl")
                call PreloadEffect("war3mapImported\\Death Release.mdl")
                call PreloadEffect("war3mapImported\\Purple Lightning.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\[A]fense-lizi-toushewu.mdl")
                call PreloadEffect("war3mapImported\\[A]tx_paomo2213.mdl")
                call PreloadEffect("war3mapImported\\TohkaEf3.mdl")
                call PreloadEffect("war3mapImported\\az_zise-xuanwo.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]AZ_Alleria_R3.mdl")
                call PreloadEffect("war3mapImported\\TohkaEf5.mdl")
                call PreloadEffect("war3mapImported\\[DoFT]PurpleAz-hit.mdl")
                call PreloadEffect("war3mapImported\\FadeSpearPurple.mdl")
                call PreloadEffect("war3mapImported\\[A]TohkaExp.mdl")
                call PreloadEffect("war3mapImported\\TohkaEf4.mdl")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\toonboomblue.mdx")
                call PreloadEffect("war3mapimported\\tenshi swr explode.mdx")
                call PreloadEffect("war3mapImported\\valkkame4.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\blue-guagnzhu-special.mdx")
                call PreloadEffect("war3mapimported\\A(BlackPink).mdx")
                call PreloadEffect("war3mapimported\\TohkaEnergy.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]az-zise-toushewu.mdx")
                call PreloadEffect("war3mapimported\\bymutou-hongse-pink.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]purple-shoot.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx")
                call PreloadEffect("war3mapimported\\[A]t_icesparks.mdx")
            endif
        endif
        if uid == 'H00Y' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdl")
                call PreloadEffect("war3mapImported\\zxd6.mdl")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\zxd3.mdx")
                call PreloadEffect("war3mapimported\\blackblink.mdx")
                call PreloadEffect("war3mapimported\\YoooBug_HitFx.mdx")
                call PreloadEffect("war3mapimported\\WindWeak2.mdx")
                call PreloadEffect("war3mapimported\\slashone.mdx")
                call PreloadEffect("war3mapimported\\FCJX_DG.mdx")
                call PreloadEffect("war3mapImported\\DGDDXZ4.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapimported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapImported\\blue-daoguang-new.mdl")
                call PreloadEffect("war3mapimported\\VergilSlashes.mdx")
                call PreloadEffect("war3mapimported\\File00010078.mdx")
                call PreloadEffect("war3mapimported\\File00009632.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\glowline(blue).mdx")
                call PreloadEffect("war3mapImported\\Black.mdl")
                call PreloadEffect("war3mapimported\\az_yishan2.mdx")
                call PreloadEffect("war3mapimported\\JeanlilyHXDG1.mdx")
                call PreloadEffect("war3mapimported\\wavejojo.mdx")
                call PreloadEffect("war3mapimported\\DustWindFasterExact.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]az_pafeathermoon_b.mdx")
                call PreloadEffect("war3mapimported\\Ephemeral Cut Midnight.mdx")
                call PreloadEffect("war3mapimported\\[DoFT]hero_skeletonking_n2s_e_star.mdx")
                call PreloadEffect("war3mapimported\\BloodEX.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\[DoFT]blinkcasterWhite.mdx")
                call PreloadEffect("war3mapimported\\Kaca_Pecah.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\shoc2.mdx")
                call PreloadEffect("war3mapimported\\[A]Sand3.mdx")
            endif
        endif
        if uid == 'H00Z' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\Dota_Effect_lina_longpozhan.mdx")
                call PreloadEffect("war3mapimported\\qj3.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\BlackBlink.mdx")
                call PreloadEffect("war3mapimported\\LW11.mdx")
                call PreloadEffect("war3mapimported\\firebomb.mdx")
                call PreloadEffect("war3mapimported\\fire-boom-new.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\az-zidan.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\firebbic.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\fireleaf.mdx")
                call PreloadEffect("war3mapimported\\[a]flame burst2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\zxd3.mdx")
                call PreloadEffect("war3mapimported\\BY_Wood_Decade_RiderKick_Explode.mdx")
            endif
        endif
        if uid == 'H000' then
            if eid == 1 then
                call PreloadEffect("war3mapimported\\valkdust.mdx")
                call PreloadEffect("war3mapimported\\darkblast.mdx")
                call PreloadEffect("war3mapimported\\redshockwave.mdx")
                call PreloadEffect("war3mapimported\\red power ball.mdx")
                call PreloadEffect("war3mapimported\\red ball.mdx")
                call PreloadEffect("war3mapimported\\wind3.mdx")
                call PreloadEffect("war3mapimported\\superbigexplosion.mdx")
                call PreloadEffect("war3mapimported\\shrapnelshards.mdx")
                call PreloadEffect("war3mapimported\\redring.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapimported\\blackblink.mdx")
                call PreloadEffect("war3mapimported\\supershinythingy5.mdx")
                call PreloadEffect("war3mapimported\\effect_ReiatsuOverFlowbyDeckai.mdx")
                call PreloadEffect("war3mapimported\\pinkredlaser.mdx")
                call PreloadEffect("war3mapimported\\ultizoro.mdx")
                call PreloadEffect("war3mapimported\\superbigbombexplosionred.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapimported\\violet spark by deckai.mdx")
                call PreloadEffect("war3mapimported\\dtpink.mdx")
                call PreloadEffect("war3mapimported\\shadowtornado.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\bubble.mdl")
                call PreloadEffect("war3mapImported\\punchshot.mdl")
                call PreloadEffect("war3mapImported\\earthdetonation.mdl")
                call PreloadEffect("war3mapImported\\dls2.mdl")
                call PreloadEffect("war3mapImported\\wind4.mdl")
                call PreloadEffect("war3mapImported\\ZamasuEffect1.mdl")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect43.mdl")
            elseif eid == 5 then
                call PreloadEffect("war3mapimported\\wavejojo.mdx")
                call PreloadEffect("war3mapimported\\Hit.mdx")
                call PreloadEffect("war3mapimported\\ZamasuEffect2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapimported\\SuperShinyThingy7.mdx")
                call PreloadEffect("war3mapimported\\kamehaballrose.mdx")
                call PreloadEffect("war3mapimported\\shockwave(pink).mdx")
                call PreloadEffect("war3mapimported\\A7_zisekuosan.mdx")
                call PreloadEffect("war3mapimported\\SuperBigBombExplosionPink.mdx")
                call PreloadEffect("war3mapimported\\firagawhite.mdx")
                call PreloadEffect("war3mapimported\\dtbluenoringwhite.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapimported\\DarkSword.mdx")
                call PreloadEffect("war3mapimported\\bloodex.mdx")
                call PreloadEffect("war3mapimported\\StarSlash(Missle).mdx")
                call PreloadEffect("war3mapimported\\helgate1.mdx")
            endif
        endif
       
    endfunction

    function runLoadEffect takes nothing returns nothing
        if EffectCount <= MaxEffect then
            if UserPlayer(Player(1)) then
                call LoadEffectStart(HeroType[MemoHero[1]])
            endif
            if UserPlayer(Player(2)) then
                call LoadEffectStart(HeroType[MemoHero[2]])
            endif
            if UserPlayer(Player(3)) then
                call LoadEffectStart(HeroType[MemoHero[3]])
            endif
            if UserPlayer(Player(5)) then
                call LoadEffectStart(HeroType[MemoHero[5]])
            endif
            if UserPlayer(Player(6)) then
                call LoadEffectStart(HeroType[MemoHero[6]])
            endif
            if UserPlayer(Player(7)) then
                call LoadEffectStart(HeroType[MemoHero[7]])
            endif
            if UserPlayer(Player(9)) then
                call LoadEffectStart(HeroType[MemoHero[9]])
            endif
            if UserPlayer(Player(10)) then
                call LoadEffectStart(HeroType[MemoHero[10]])
            endif
            if UserPlayer(Player(11)) then
                call LoadEffectStart(HeroType[MemoHero[11]])
            endif
            set EffectCount = EffectCount + 1
        else
            set SelectHeroTime = - 1.1
            set LoadEffectFinish = true
            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
        endif
    endfunction

    function callPreloadEffect takes nothing returns nothing
        call TimerStart(CreateTimer(), 0.5, true, function runLoadEffect)
    endfunction
endlibrary