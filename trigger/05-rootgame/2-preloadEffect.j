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
        if uid == 'H046' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\az_cocochristmas_d_impact_red.mdx")
                call PreloadEffect("war3mapImported\\white-qiquan-juhuang_red.mdx")
                call PreloadEffect("war3mapImported\\xtyball.mdx")
                call PreloadEffect("war3mapImported\\W_Effect05.mdx")
                call PreloadEffect("war3mapImported\\bymutou_huozhu_siwang-red.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\white-shandian-qiquan-yellow.mdx")
                call PreloadEffect("war3mapImported\\whiteslice_yellow.mdx")
                call PreloadEffect("war3mapImported\\white-qiquan-juhuang_yellow.mdx")
                call PreloadEffect("war3mapImported\\RaitonAizen2.mdx")
                call PreloadEffect("war3mapImported\\az_cocochristmas_d_impact_yellow.mdx")
                call PreloadEffect("war3mapImported\\az_kaldr_blast_t2_yellow.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\[DoFT]chushou_by_wood_effect_huozhu_purple.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]Kurohitsugib.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]blood132.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\[DoFT]twist.mdx")
                call PreloadEffect("war3mapImported\\Black.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]HadoDragon.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]AizenTEffect.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]DaoGuang_BaoZha_purple.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\[DoFT]cf.mdx")
                call PreloadEffect("war3mapImported\\DustWaveNew.mdx")
                call PreloadEffect("war3mapImported\\white-qiquan-juhuang.mdx")
                call PreloadEffect("war3mapImported\\Aizen_Form_squished.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]dingzhi_by_wood_effect_blood_biaoxue_2.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]t_thunderclapcaster.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]az_hit-blue-blade.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\[DoFT]az_xuanfeng1.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]blinkcasterWhite.mdx")
            endif
        elseif uid == 'H0BM' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\[a]explodeorange.mdx")
                call PreloadEffect("war3mapImported\\Holy_Fire_Slam3.mdx")
                call PreloadEffect("war3mapImported\\[A]Natsu roar 3.mdx")
                call PreloadEffect("war3mapImported\\[A]FireShockRun(fire2).mdx")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_Kong.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\[A]AceFireShockRun.mdx")
                call PreloadEffect("war3mapImported\\Ethereal Lightning.mdx")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdx")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdx")
                call PreloadEffect("war3mapImported\\[A]File00002800.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\fire1.mdx")
                call PreloadEffect("war3mapImported\\[A]acefireshockrun.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\qj3.mdx")
                call PreloadEffect("war3mapImported\\[A]Nuke2.mdx")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_FenShenDaBaoPo_2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\[A]AceBall.mdx")
                call PreloadEffect("war3mapImported\\KatonGoukaMekkyaku.mdx")
                call PreloadEffect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\AceRef.mdx")
                call PreloadEffect("war3mapImported\\[A]zhendi-fire-dici.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\ZeroPinkGreen.mdx")
                call PreloadEffect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdx")
            endif
        elseif uid == 'H02E' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdx")
                call PreloadEffect("war3mapImported\\Dls1.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\zxd1.mdx")
                call PreloadEffect("war3mapImported\\djcjb.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdx")
                call PreloadEffect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapImported\\fire-boom-new.mdx")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_1.mdx")
                call PreloadEffect("war3mapImported\\zxd6.mdx")
                call PreloadEffect("war3mapImported\\EarthDetonation.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\mbdm.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdx")
            endif
        elseif uid == 'H00J' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\dtred.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\BlackBlink.mdx")
                call PreloadEffect("war3mapImported\\DGDDXZ4.mdx")
                call PreloadEffect("war3mapImported\\bloodhit1.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\Black.mdx")
                call PreloadEffect("war3mapImported\\akamerdash.mdx")
                call PreloadEffect("war3mapImported\\AizenJHSY.mdx")
                call PreloadEffect("war3mapImported\\TZJQ5.mdx")
                call PreloadEffect("war3mapImported\\AZ_PA_B2.mdx")
                call PreloadEffect("war3mapImported\\Akame.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\wind4.mdx")
                call PreloadEffect("war3mapImported\\HakenSaber2.mdx")
                call PreloadEffect("war3mapImported\\QQQQQR.mdx")
                call PreloadEffect("war3mapImported\\zxd6.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\EarthDetonation.mdx")
                call PreloadEffect("war3mapImported\\[A]Sand3.mdx")
                call PreloadEffect("war3mapImported\\blood-rou.mdx")
                call PreloadEffect("war3mapImported\\File00003933.mdx")
                call PreloadEffect("war3mapImported\\bloodex1.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\nitu.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
                call PreloadEffect("war3mapImported\\Ephemeral Slash Orange.mdx")
            endif
        elseif uid == 'H011' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapImported\\dash sfx.mdx")
                call PreloadEffect("war3mapImported\\effect_alice01.mdx")
                call PreloadEffect("war3mapImported\\effect_alice08.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapImported\\[A]blue-qiliu-daoguang_2.mdx")
                call PreloadEffect("war3mapImported\\Tanziro_Skill.mdx")
                call PreloadEffect("war3mapImported\\lb_hdg.mdx")
                call PreloadEffect("war3mapImported\\BloodEX-Special-2.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\blackblink.mdx")
                call PreloadEffect("war3mapImported\\effect_alice05.mdx")
                call PreloadEffect("war3mapImported\\[a]zoroef.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]az_pafeathermoon_b-orange.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapImported\\[Plagiat]Effect249.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\zygz.mdx")
                call PreloadEffect("war3mapImported\\Black.mdx")
                call PreloadEffect("war3mapImported\\reimuLS-yellow.mdx")
                call PreloadEffect("war3mapImported\\effect_alice04.mdx")
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
                call PreloadEffect("war3mapImported\\hit-blood-special.mdx")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapImported\\az_hitheavy.mdx")
                call PreloadEffect("war3mapImported\\qqqqqr.mdx")
                call PreloadEffect("war3mapImported\\az-zidan.mdx")
                call PreloadEffect("war3mapImported\\AliceFSFX1.mdx")
                call PreloadEffect("war3mapImported\\AliceFSFX2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\oxgz-alice.mdx")
            endif
        elseif uid == 'H016' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\CF2.mdx")
                call PreloadEffect("war3mapImported\\WindExploreEffect(Bigger).mdx")
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\az_slb.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx")
                call PreloadEffect("war3mapImported\\az_pafeathermoon_b.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\wind4.mdx")
                call PreloadEffect("war3mapImported\\az_pa_c-black2.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
                call PreloadEffect("war3mapImported\\WindWeak(Thicker).mdx")
                call PreloadEffect("war3mapImported\\az_cocochristmas_d_impact_yellow.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\Black.mdx")
                call PreloadEffect("war3mapImported\\Arthur Pendragon.mdx")
                call PreloadEffect("war3mapImported\\ArthurSlam.mdx")
                call PreloadEffect("war3mapImported\\anspdbb.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapImported\\AncientExplodeOrange&Yellow.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\ArthurLight2.mdx")
                call PreloadEffect("war3mapImported\\HolyBlessing.mdx")
                call PreloadEffect("war3mapImported\\EX light.mdx")
                call PreloadEffect("war3mapImported\\[A]judgement.mdx")
                call PreloadEffect("war3mapImported\\AFB_shanguang6_1.mdx")
                call PreloadEffect("war3mapImported\\dunno2.mdx")
                call PreloadEffect("war3mapImported\\yellowql.mdx")
                call PreloadEffect("war3mapImported\\GoldenFlameWave.mdx")
                call PreloadEffect("war3mapImported\\fanty (86).mdx")
                call PreloadEffect("war3mapImported\\aliceswordslam.mdx")
                call PreloadEffect("war3mapImported\\BlinkCaster.mdx")
                call PreloadEffect("war3mapImported\\white-qiquan-juhuang_yellow.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\nlygpz.mdx")
                call PreloadEffect("war3mapImported\\yellow-guagnzhu-special.mdx")
                call PreloadEffect("war3mapImported\\2953.mdx")
                call PreloadEffect("war3mapImported\\WindExploreEffect(Bigger).mdx")
                call PreloadEffect("war3mapImported\\Xuanfeng_whitewind.mdx")
                call PreloadEffect("war3mapImported\\az_pafeathermoon_b.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\blackblink.mdx")
                call PreloadEffect("war3mapImported\\zxd1.mdx")
                call PreloadEffect("war3mapImported\\62.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]e_slashred.mdx")
                call PreloadEffect("war3mapImported\\zxd6.mdx")
            endif
        elseif uid == 'H063' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\eslash2.mdx")
                call PreloadEffect("war3mapImported\\TZJQ5.mdx")
                call PreloadEffect("war3mapImported\\AFBRedCharge.mdx")
                call PreloadEffect("war3mapImported\\cf2.mdx")
                call PreloadEffect("war3mapImported\\dc-slashslam.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\az_pafeathermoon_b.mdx")
                call PreloadEffect("war3mapImported\\star-magic.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_DanGe_ZhanJi_DaoGuang_6_1-Red.mdx")
                call PreloadEffect("war3mapImported\\DYoumu_BladeEx.mdx")
                call PreloadEffect("war3mapImported\\bloodslash.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]hero_skeletonking_n2s_e_star.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdx")
                call PreloadEffect("war3mapImported\\blackblink.mdx")
                call PreloadEffect("war3mapImported\\white-qiquan-juhuang_red.mdx")
                call PreloadEffect("war3mapImported\\animeslashfinal.mdx")
                call PreloadEffect("war3mapImported\\yydlz.mdx")
                call PreloadEffect("war3mapImported\\OkitaAlterEff1.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\Knife1.mdx")
                call PreloadEffect("war3mapImported\\OkitaAlterEff2.mdx")
                call PreloadEffect("war3mapImported\\Knife2.mdx")
                call PreloadEffect("war3mapImported\\OkitaAlterEff3.mdx")
                call PreloadEffect("war3mapImported\\afbxnntx.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\DGDDXZ4.mdx")
                call PreloadEffect("war3mapImported\\zhanji-redx-shu3.mdx")
                call PreloadEffect("war3mapImported\\amx (345)_white.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapImported\\hakensaber2.mdx")
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
                call PreloadEffect("war3mapImported\\k4.mdx")
                call PreloadEffect("war3mapImported\\blackblink1.mdx")
                call PreloadEffect("war3mapImported\\white-qiquan-juhuang_red.mdx")
                call PreloadEffect("war3mapImported\\white-qiquan-juhuang_yellow.mdx")
                call PreloadEffect("war3mapImported\\Black.mdx")
                call PreloadEffect("war3mapImported\\OkitaAlterEff4.mdx")
                call PreloadEffect("war3mapImported\\AFB_shanguang5_1.mdx")
                call PreloadEffect("war3mapImported\\effect2.mdx")
                call PreloadEffect("war3mapImported\\az_pafeathermoon_b.mdx")
                call PreloadEffect("war3mapImported\\jxpx.mdx")
                call PreloadEffect("war3mapImported\\az_hitheavy.mdx")
                call PreloadEffect("war3mapImported\\[DoFT]e_slashred.mdx")
                call PreloadEffect("war3mapImported\\TZJQ5.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_1.mdx")
                call PreloadEffect("war3mapImported\\exshexian5black.mdx")
                call PreloadEffect("war3mapImported\\exshexian5white.mdx")
                call PreloadEffect("war3mapImported\\zxd1.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\LaxusLighthing.mdx")
                call PreloadEffect("war3mapImported\\OkitaAlterEff5.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\zxd1.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
            endif
        elseif uid == 'H0G1' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\ice-danmu.mdx")
                call PreloadEffect("war3mapImported\\AFBBXKS.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\tx012a.mdx")
                call PreloadEffect("war3mapImported\\bingk.mdx")
                call PreloadEffect("war3mapImported\\[Effect]534.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\blueauralance.mdx")
                call PreloadEffect("war3mapImported\\hitsugayabfardragonline.mdx")
                call PreloadEffect("war3mapImported\\az_cocochristmas_d_impact.mdx")
                call PreloadEffect("war3mapImported\\az_nevermoreice_x.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\ice_snow_inc.mdx")
                call PreloadEffect("war3mapImported\\icestolb.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\icefirst.mdx")
                call PreloadEffect("war3mapImported\\sbss_bingdongxili.mdx")
                call PreloadEffect("war3mapImported\\icestomp.mdx")
                call PreloadEffect("war3mapImported\\sxbbtx2.mdx")
            endif
        elseif uid == 'H03E' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\File00005630.mdx")
                call PreloadEffect("war3mapImported\\0631.mdx")
                call PreloadEffect("war3mapImported\\FantasyBattle (1520).mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\1062.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\0614.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\0227.mdx")
                call PreloadEffect("war3mapImported\\BD_YEQI03.mdx")
                call PreloadEffect("war3mapImported\\File00000012.mdx")
                call PreloadEffect("war3mapImported\\zm (280).mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\fanty (86).mdx")
                call PreloadEffect("war3mapImported\\0810.mdx")
                call PreloadEffect("war3mapImported\\File00002384.mdx")
                call PreloadEffect("war3mapImported\\FantasyBattle (1643).mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\0203.mdx")
                call PreloadEffect("war3mapImported\\zm (280).mdx")
                call PreloadEffect("war3mapImported\\File00002085.mdx")
                call PreloadEffect("war3mapImported\\File00002105.mdx")
                call PreloadEffect("war3mapImported\\36.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\kaizokusfxbyvalk4.mdx")
                call PreloadEffect("war3mapImported\\HelGate1.mdx")
                call PreloadEffect("war3mapImported\\Cleave.mdx")
                call PreloadEffect("war3mapImported\\SBXZAFB2.mdx")
            endif
        elseif uid == 'H00M' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\afbctzsntx.mdx")
                call PreloadEffect("war3mapImported\\glchj.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\BlackBlink.mdx")
                call PreloadEffect("war3mapImported\\3shadowassault(lightzi)waveblue.mdx")
                call PreloadEffect("war3mapImported\\tx-smoke1.mdx")
                call PreloadEffect("war3mapImported\\dash sfx.mdx")
                call PreloadEffect("war3mapImported\\valkdustNew.mdx")
                call PreloadEffect("war3mapImported\\windslash.mdx")
                call PreloadEffect("war3mapImported\\ultizoro.mdx")
                call PreloadEffect("war3mapImported\\windweak2.mdx")
                call PreloadEffect("war3mapImported\\xjbz.mdx")
                call PreloadEffect("war3mapImported\\xzblue.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\AizenJHSY.mdx")
                call PreloadEffect("war3mapImported\\zhanji-blue-shu.mdx")
                call PreloadEffect("war3mapImported\\Black.mdx")
                call PreloadEffect("war3mapImported\\sxcf2.mdx")
                call PreloadEffect("war3mapImported\\[A]WhiteSlash.mdx")
                call PreloadEffect("war3mapImported\\ogitasoji.mdx")
                call PreloadEffect("war3mapImported\\Ephemeral Cut Midnight.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\CTshoting.mdx")
                call PreloadEffect("war3mapImported\\kdls2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx")
                call PreloadEffect("war3mapImported\\123 (383)_2.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\zxd3.mdx")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
                call PreloadEffect("war3mapImported\\wind4.mdx")
                call PreloadEffect("war3mapImported\\windcirclefaster.mdx")
                call PreloadEffect("war3mapImported\\blue-guagnzhu-special.mdx")
                call PreloadEffect("war3mapImported\\hit-blood-special.mdx")
                call PreloadEffect("war3mapImported\\jin xia.mdx")
                call PreloadEffect("war3mapImported\\red-blood-ball.mdx")
                call PreloadEffect("war3mapImported\\blood-rou.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\shanguangbiubiu.mdx")
                call PreloadEffect("war3mapImported\\wavejojo.mdx")
                call PreloadEffect("war3mapImported\\model (24).mdx")
                call PreloadEffect("war3mapImported\\0227.mdx")
                call PreloadEffect("war3mapImported\\[a]az-ice-zhendi.mdx")
                call PreloadEffect("war3mapImported\\[A]ChuShou_Blue1.mdx")
            endif
        elseif uid == 'H0CT' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\BY_Wood_Decade_RiderKick_Ring.mdx")
                call PreloadEffect("war3mapImported\\earthdetonation.mdx")
                call PreloadEffect("war3mapImported\\Dls2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\0236.mdx")
                call PreloadEffect("war3mapImported\\tx-smoke1.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
                call PreloadEffect("war3mapImported\\[A]GongChengBlue.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdx")
                call PreloadEffect("war3mapImported\\[A]Sand3.mdx")
                call PreloadEffect("war3mapImported\\tx-smoke1.mdx")
                call PreloadEffect("war3mapImported\\[A]RinRfire1.mdx")
                call PreloadEffect("war3mapImported\\[A]SlamWithOut.mdx")
                call PreloadEffect("war3mapImported\\[A]StompNew.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Sand_YueKongJi.mdx")
                call PreloadEffect("war3mapImported\\blackblink1.mdx")
                call PreloadEffect("war3mapImported\\by_wood_bashenan_juqi_1_4.mdx")
                call PreloadEffect("war3mapImported\\bowen1.mdx")
                call PreloadEffect("war3mapImported\\File00001831.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\wavejojo.mdx")
                call PreloadEffect("war3mapImported\\valkdustnew.mdx")
                call PreloadEffect("war3mapImported\\[A]ZoroEf6.mdx")
                call PreloadEffect("war3mapImported\\[a]t_icesparks.mdx")
                call PreloadEffect("war3mapImported\\SBXZAFB2.mdx")
                call PreloadEffect("war3mapImported\\Dls1.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\punchshot.mdx")
                call PreloadEffect("war3mapImported\\wind2.mdx")
                call PreloadEffect("war3mapImported\\by_wood_gongchengsipai_3_white.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\DustWaveAnimate2.mdx")
                call PreloadEffect("war3mapImported\\dash sfx 2.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\smokefuzzy.mdx")
                call PreloadEffect("war3mapImported\\[A]cherry blossom impact.mdx")
                call PreloadEffect("war3mapImported\\blinknew2.mdx")
                call PreloadEffect("war3mapImported\\fuzzystomp.mdx")
            endif
        elseif uid == 'H010' then
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
                call PreloadEffect("war3mapImported\\dls1.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\blueslash.mdx")
                call PreloadEffect("war3mapImported\\[A]Sand3.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\zxd3.mdx")
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
        elseif uid == 'H0G2' then
            if eid == 1 then
                call PreloadEffect("war3mapImported\\djcjb.mdx")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx")
            elseif eid == 2 then
                call PreloadEffect("war3mapImported\\asknhq.mdx")
                call PreloadEffect("war3mapImported\\Dls1.mdx")
                call PreloadEffect("war3mapImported\\shuozhu1.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3.mdx")
                call PreloadEffect("war3mapImported\\az_tormentedsoul_t1.mdx")
            elseif eid == 3 then
                call PreloadEffect("war3mapImported\\a_new_k3.mdx")
                call PreloadEffect("war3mapImported\\[A]az_axe_ef1.mdx")
                call PreloadEffect("war3mapImported\\WindCirclefaster.mdx")
                call PreloadEffect("war3mapImported\\wind3.mdx")
                call PreloadEffect("war3mapImported\\SBXZAFB2.mdx")
                call PreloadEffect("war3mapImported\\XZDL2.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx")
                call PreloadEffect("war3mapImported\\SZBYAFB2.mdx")
            elseif eid == 4 then
                call PreloadEffect("war3mapImported\\shuozhu2.mdx")
            elseif eid == 5 then
                call PreloadEffect("war3mapImported\\shuozhu3.mdx")
                call PreloadEffect("war3mapImported\\Black.mdx")
                call PreloadEffect("war3mapImported\\by_wood_effect_yuzhiboyou_unusual_yuedu_1.mdx")
                call PreloadEffect("war3mapImported\\AFBHQ.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3.mdx")
                call PreloadEffect("war3mapImported\\XZDL.mdx")
            elseif eid == 6 then
                call PreloadEffect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdx")
                call PreloadEffect("war3mapImported\\wind4.mdx")
            elseif eid == 7 then
                call PreloadEffect("war3mapImported\\BY_Wood_Decade_RiderKick_Ring.mdx")
                call PreloadEffect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdx")
                call PreloadEffect("war3mapImported\\earthdetonation.mdx")
                call PreloadEffect("war3mapImported\\yayacleave.mdx")
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
        call TimerStart(CreateTimer() , 0.5, true, function runLoadEffect)
    endfunction
endlibrary