library lowefflib
    function lowEffectCheck takes string path returns string
        local integer pid = GetPlayerId(GetLocalPlayer())
        if StringContains(path, "war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\SZBYAFB2", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\SZBYAFB2-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\Dls1", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\Dls1-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\SKSKSK2", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\SKSKSK2-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\File00002105", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\File00002105-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\zm (280)", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\zm (280)-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\XZDL2", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\XZDL2-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\sjkjz", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\sjkjz-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\[A]ChuShou_Blue", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\[A]ChuShou_Blue-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\0631", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\0631-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\0203", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\0203-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\0810", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\0810-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\File00002384", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\File00002384-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\BY_Wood_Effect_Order_DanGe_YueYun_2", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\BY_Wood_Effect_Order_DanGe_YueYun_2-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\qj3", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\qj3-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\AZ_WSY_Misslie", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\AZ_WSY_Misslie-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\sbss_bingdongxili", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\sbss_bingdongxili-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\bkks", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\bkks-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\sxbbtx1", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\sxbbtx1-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\az_nevermoreice_x", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\az_nevermoreice_x-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\AFB_dabaozha", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\AFB_dabaozha-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\fireleaf", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\fireleaf-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\firebbic", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\firebbic-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\War3_JSSTZS", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\War3_JSSTZS-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\File00002084", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\File00002084-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\Vergil-8", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\Vergil-8-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\File00003016", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\File00003016-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2_2", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2_2-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\anssd2", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\anssd2-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\Asuma-Explosion", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\Asuma-Explosion-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\Abyssal_Impact_Base", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\Abyssal_Impact_Base-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\jxlsxf", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\jxlsxf-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\jxxz", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\jxxz-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\[A]ChuShou_Blue1", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\[A]ChuShou_Blue1-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\[DoFT]DaoGuang_BaoZha_purple", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\[DoFT]DaoGuang_BaoZha_purple-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\XZDL", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\XZDL-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\dzxb1", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\dzxb1-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\AceRef", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\AceRef-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\KHFIRE3", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\KHFIRE3-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\huozhu", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\huozhu-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\shunyihuoyan", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\shunyihuoyan-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\BreathOfFireMissile", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\BreathOfFireMissile-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\hhzy123", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\hhzy123-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\[DoFT]chushou_by_wood_effect_huozhu_purple", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\[DoFT]chushou_by_wood_effect_huozhu_purple-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\flamestrike i", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\flamestrike i.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\flames&smoke", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\flames&smoke-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\Evolt-7", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\Evolt-7-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\moonwrath-purple", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\moonwrath-purple-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\Evolt-1", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\Evolt-1-low.mdl"
            endif
            return path
        elseif StringContains(path, "war3mapImported\\Evolt-1_new", false)  then
            if LowEffect[pid] then
                set path = "war3mapImported\\Evolt-1_new-low.mdl"
            endif
            return path
        endif
        
        return path
    endfunction
endlibrary