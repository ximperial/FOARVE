library lowefflib
    function lowEffectCheck takes string path returns string
        local integer pid = GetPlayerId(GetLocalPlayer())
        if StringContains(path, "BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2", "BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2-low", false)
            endif
        elseif StringContains(path, "SZBYAFB2", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "SZBYAFB2", "SZBYAFB2-low", false)
            endif
        elseif StringContains(path, "Dls1", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "Dls1", "Dls1-low", false)
            endif
        elseif StringContains(path, "SKSKSK2", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "SKSKSK2", "SKSKSK2-low", false)
            endif
        elseif StringContains(path, "BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2", "BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2-low", false)
            endif
        elseif StringContains(path, "File00002105", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "File00002105", "File00002105-low", false)
            endif
        elseif StringContains(path, "zm (280)", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "zm (280)", "zm (280)-low", false)
            endif
        elseif StringContains(path, "BY_Wood_Effect_KOF_BaShenAn_BaJiuBei", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "BY_Wood_Effect_KOF_BaShenAn_BaJiuBei", "BY_Wood_Effect_KOF_BaShenAn_BaJiuBei-low", false)
            endif
        elseif StringContains(path, "XZDL2", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "XZDL2", "XZDL2-low", false)
            endif
        elseif StringContains(path, "sjkjz", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "sjkjz", "sjkjz-low", false)
            endif
        elseif StringContains(path, "[A]ChuShou_Blue", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "[A]ChuShou_Blue", "[A]ChuShou_Blue-low", false)
            endif
        elseif StringContains(path, "0631", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "0631", "0631-low", false)
            endif
        elseif StringContains(path, "0203", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "0203", "0203-low", false)
            endif
        elseif StringContains(path, "0810", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "0810", "0810-low", false)
            endif
        elseif StringContains(path, "File00002384", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "File00002384", "File00002384-low", false)
            endif
        elseif StringContains(path, "BY_Wood_Effect_Order_DanGe_YueYun_2", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "BY_Wood_Effect_Order_DanGe_YueYun_2", "BY_Wood_Effect_Order_DanGe_YueYun_2-low", false)
            endif
        elseif StringContains(path, "qj3", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "qj3", "qj3-low", false)
            endif
        elseif StringContains(path, "AZ_WSY_Misslie", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "AZ_WSY_Misslie", "AZ_WSY_Misslie-low", false)
            endif
        elseif StringContains(path, "sbss_bingdongxili", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "sbss_bingdongxili", "sbss_bingdongxili-low", false)
            endif
        elseif StringContains(path, "bkks", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "bkks", "bkks-low", false)
            endif
        elseif StringContains(path, "sxbbtx1", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "sxbbtx1", "sxbbtx1-low", false)
            endif
        elseif StringContains(path, "az_nevermoreice_x", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "az_nevermoreice_x", "az_nevermoreice_x-low", false)
            endif
        elseif StringContains(path, "AFB_dabaozha", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "AFB_dabaozha", "AFB_dabaozha-low", false)
            endif
        elseif StringContains(path, "fireleaf", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "fireleaf", "fireleaf-low", false)
            endif
        elseif StringContains(path, "firebbic", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "firebbic", "firebbic-low", false)
            endif
        elseif StringContains(path, "War3_JSSTZS", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "War3_JSSTZS", "War3_JSSTZS-low", false)
            endif
        elseif StringContains(path, "File00002084", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "File00002084", "File00002084-low", false)
            endif
        elseif StringContains(path, "Vergil-8", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "Vergil-8", "Vergil-8-low", false)
            endif
        elseif StringContains(path, "File00003016", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "File00003016", "File00003016-low", false)
            endif
        elseif StringContains(path, "BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2_2", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2_2", "BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2_2-low", false)
            endif
        elseif StringContains(path, "anssd2", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "anssd2", "anssd2-low", false)
            endif
        elseif StringContains(path, "Asuma-Explosion", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "Asuma-Explosion", "Asuma-Explosion-low", false)
            endif
        elseif StringContains(path, "Abyssal_Impact_Base", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "Abyssal_Impact_Base", "Abyssal_Impact_Base-low", false)
            endif
        elseif StringContains(path, "jxlsxf", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "jxlsxf", "jxlsxf-low", false)
            endif
        elseif StringContains(path, "jxxz", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "jxxz", "jxxz-low", false)
            endif
        elseif StringContains(path, "[A]ChuShou_Blue1", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "[A]ChuShou_Blue1", "[A]ChuShou_Blue1-low", false)
            endif
        elseif StringContains(path, "BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2", "BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2-low", false)
            endif
        elseif StringContains(path, "[DoFT]DaoGuang_BaoZha_purple", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "[DoFT]DaoGuang_BaoZha_purple", "[DoFT]DaoGuang_BaoZha_purple-low", false)
            endif
        elseif StringContains(path, "BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3", "BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3-low", false)
            endif
        elseif StringContains(path, "XZDL", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "XZDL", "XZDL-low", false)
            endif
        elseif StringContains(path, "dzxb1", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "dzxb1", "dzxb1-low", false)
            endif
        elseif StringContains(path, "AceRef", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "AceRef", "AceRef-low", false)
            endif
        elseif StringContains(path, "KHFIRE3", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "KHFIRE3", "KHFIRE3-low", false)
            endif
        elseif StringContains(path, "huozhu", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "huozhu", "huozhu-low", false)
            endif
        elseif StringContains(path, "shunyihuoyan", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "shunyihuoyan", "shunyihuoyan-low", false)
            endif
        elseif StringContains(path, "BreathOfFireMissile", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "BreathOfFireMissile", "BreathOfFireMissile-low", false)
            endif
        elseif StringContains(path, "chushou_by_wood_effect_unusual_kof_caoti_huozhu", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "chushou_by_wood_effect_unusual_kof_caoti_huozhu", "chushou_by_wood_effect_unusual_kof_caoti_huozhu-low", false)
            endif
        elseif StringContains(path, "hhzy123", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "hhzy123", "hhzy123-low", false)
            endif
        elseif StringContains(path, "[DoFT]chushou_by_wood_effect_huozhu_purple", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "[DoFT]chushou_by_wood_effect_huozhu_purple", "[DoFT]chushou_by_wood_effect_huozhu_purple-low", false)
            endif
        elseif StringContains(path, "by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong", "by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong-low", false)
            endif
        elseif StringContains(path, "flamestrike i", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "flamestrike i", "flamestrike i-low", false)
            endif
        elseif StringContains(path, "flames&smoke", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "flames&smoke", "flames&smoke-low", false)
            endif
        elseif StringContains(path, "Evolt-7", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "Evolt-7", "Evolt-7-low", false)
            endif
        elseif StringContains(path, "moonwrath-purple", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "moonwrath-purple", "moonwrath-purple-low", false)
            endif
        elseif StringContains(path, "Evolt-1", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "Evolt-1", "Evolt-1-low", false)
            endif
        elseif StringContains(path, "Evolt-1_new", false)  then
            if LowEffect[pid] then
                set path = StringReplace(path, "Evolt-1_new", "Evolt-1_new-low", false)
            endif
        endif
        return path
    endfunction
endlibrary