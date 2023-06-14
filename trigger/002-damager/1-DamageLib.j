scope DamageLib
    function HibariE_End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local integer dmg = LoadInteger(ht, GetHandleId(z) , 0)
        call UnitAddBonus(c, BONUS_ATTACK, - dmg)
        call FlushChildHashtable(ht, GetHandleId(z))
        call DestroyTimer(z)
        set z = null
        set c = null
    endfunction
    
    function AizenD_End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local unit c2
        local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local real x
        local real y
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then 
            call SoundStart("war3mapImported\\Aizen_7-1.mp3")
            call SetUnitAnimationByIndex(c, 11)
            call Effect("war3mapimported\\[DoFT]az_xuanfeng1.mdx", GetUnitX(c) , GetUnitY(c) , 25, 270, 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count >= 80 then 
            call SoundStart("war3mapImported\\Aizen_7-2.mp3")
            call Effect("war3mapimported\\white-qiquan-juhuang.mdx", GetUnitX(t) , GetUnitY(t) , 25, 270, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]blinkcasterWhite.mdx", GetUnitX(t) , GetUnitY(t) , 25, 270, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx", GetUnitX(t) , GetUnitY(t) , 25, 270, 0, 0, 1.5, 1, 255, 255, 255, 255)
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            call SetUnitX(t, GetUnitX(c))
            call SetUnitY(t, GetUnitY(c))
            call SetUnitX(c, x)
            call SetUnitY(c, y)
            call SetUnitInvulnerable(c, false)
            call SetUnitInvulnerable(t, false)
            set c2 = LoadUnitHandle(ht, StringHash("AizenD") , GetHandleId(c))
            call DamageUnit(c2 , t, (8 + 0.4 * GetUnitAbilityLevel(c2 , 'A03V')) * GetHeroAgi(c2 , true))
            call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call PauseUnit(c, false)
            call PauseUnit(t, false)
            call IssueTargetOrderById(c, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call RemoveSavedHandle(ht, StringHash("AizenD") , GetHandleId(c))
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set c = null
        set c2 = null
        set t = null
    endfunction
    
    function AizenD_Start takes unit c, unit t returns nothing
        local timer z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call TimerStart(z, 0.02, true, function AizenD_End)
        set z = null
    endfunction
    
    function TomaE_End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
        local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        local integer count = LoadInteger(ht, GetHandleId(z) , 0)
        local real x
        local real y
        local integer i = 0
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then 
            call SoundStart("war3mapImported\\Toma_1-1.mp3")
            call SetUnitAnimationByIndex(c, 4)
        endif
        if count == 20 then 
            call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
            call SetUnitFacingEx(c, a, true)
            loop
                exitwhen i > 8
                set x = PolarX(GetUnitX(t) , 300, i * 40)
                set y = PolarY(GetUnitY(t) , 300, i * 40)
                call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdx", x, y, 25, i * 40, 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                set i = i + 1
            endloop
            call Effect("war3mapimported\\ToumaE2.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle(), 0, 0, 0.75, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\ToumaE.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle(), 0, 0, 0.6, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapimported\\62.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WRing.mdx", GetUnitX(t) , GetUnitY(t) , 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call PauseUnit(c, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(c, false)
            call SetUnitInvulnerable(t, false)
            call silenceUnit(t, 1)
            call IssueTargetOrderById(c, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set c = null
        set t = null
    endfunction
    
    function TomaE_Start takes unit c, unit t returns nothing
        local timer z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call TimerStart(z, 0.02, true, function TomaE_End)
        set z = null
    endfunction
    
    function YamajiR_End takes nothing returns nothing 
        local timer z = GetExpiredTimer()
        local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
        local real a = GetUnitFacing(c)
        local integer count = LoadInteger(ht, GetHandleId(z) , 0)
        local integer i = 0
        local real radius
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        if count == 1 then 
            call SoundStart("war3mapImported\\Yamaji_4-4.mp3")
            call VisionArea(GetOwningPlayer(c) , 1200, 5, GetUnitX(c) , GetUnitY(c))
            if GetUnitTypeId(c) == 'H0FV' then 
                call SetUnitAnimationByIndex(c, 5)
            else
                call SetUnitAnimationByIndex(c, 7)
            endif
            call SetUnitTimeScale(c, 0.4)
            call Effect("war3mapimported\\bymutou_huozhu_hongse3.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle(), 0, 0, 1.5, 4, 255, 255, 255, PercentTo255(60))
        endif
        if count == 1 or count == 30 or count == 60 or count == 90 or count == 120 or count == 150 or count == 180 or count == 210 or count == 240 then 
            call Effect("war3mapimported\\red-yumao-zhendiLord.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle(), 0, 0, GetRandomReal(1.2, 1.65), 1, 201, 114, 114 , PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle(), 0, 0, GetRandomReal(0.8, 1.2), 1.5, 201, 114, 114, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\AZ_Alleria_R3.mdx", GetUnitX(c) , GetUnitY(c) , 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\red-lizi-zhendi-fast.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 140 then 
            call SoundStart("war3mapImported\\Yamaji_4-5.mp3")
        endif
        if count == 230 then 
            call SoundStart("war3mapImported\\Yamaji_4-6.mp3")
            call Effect("war3mapimported\\az_baozha_red.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle(), 0, 0, 0.45, 4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\ChuShou_black.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle(), 0, 0, 1.55, 4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            loop
                exitwhen i > 5
                call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 50 + i * 200, randomAngle(), 0, 0, 2.65, 4, 210, 65, 65, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
                set i = i + 1
            endloop
            call Effect("war3mapimported\\bymutou-hongse3.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle(), 0, 0, 3, 4, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
            call SaveReal(ht, GetHandleId(z), 0, 300)
        endif
        if count >= 240 and count <= 430 then
            set radius = LoadReal(ht, GetHandleId(z), 0)
            if radius < 800 then
                set radius = radius + 9
                call SaveReal(ht, GetHandleId(z), 0, radius)
            endif
            call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , radius, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(c, gUnit) then 
                    if GetUnitTypeId(c) == 'H0FV' then
                        call DamageUnit(c, gUnit, ((8 + 2 * GetUnitAbilityLevel(c, 'A0BD')) * GetHeroStr(c, true)) / 180)
                    else
                        call DamageUnit(c, gUnit, ((6 + 2 * GetUnitAbilityLevel(c, 'A0BD')) * GetHeroStr(c, true)) / 180)
                    endif
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count <= 300 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 2000, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if not IsUnitInGroup(gUnit, g) then 
                    call GroupAddUnit(g, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
            endloop
            call GroupClear(gGroup) 
        endif
        if count == 300 then
            call ForGroup(g, function ResetMoveSpeed)
            call DestroyGroup(g) 
        endif
        if count == 430 then 
            call SetUnitTimeScale(c, 1)
            call SetUnitInvulnerable(c, false)
            call PauseUnit(c, false)
            call IssueImmediateOrderById(c, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null 
        set c = null
        set g = null
    endfunction
    
    function YamajiR_Start takes unit c returns nothing
        local timer z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function YamajiR_End)
        set z = null
    endfunction
    
    function AnosD_End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
        local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z) , 0)
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then 
            call SoundStart("war3mapImported\\Anos_7-1.mp3")
            call SetUnitAnimationByIndex(c, 3)
            call SetUnitTimeScale(c, 0.8)
        endif
        if count == 10 then
            call Effect("war3mapimported\\Dead Spirit by Deckai3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
            call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
            call SetUnitFacingEx(c, a + 180, true)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Anos_2-1.mp3")
            call Effect("war3mapimported\\afbxnntx.mdx", GetUnitX(t), GetUnitY(t), 100, a + 40, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\kdls3.mdx", GetUnitX(c), GetUnitY(c), 150, a, 0, 0, 2.5, 1, 255, 255, 255, 255) 
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3, 1, 255, 0, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 25 then 
            call SetUnitTimeScale(c, 1)
            call PauseUnit(c, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(c, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(c , t, 8 * GetHeroInt(c , true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(c, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set c = null
        set t = null
    endfunction
    
    function AnosD_Start takes unit c, unit t returns nothing
        local timer z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call TimerStart(z, 0.02, true, function AnosD_End)
        set z = null
    endfunction
    
    function TodoKirinT_End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
        local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z) , 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
        local integer i = 0
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
        if count == 1 then 
            call SoundStart("war3mapImported\\Kirin_5-7.mp3")
            call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
            call SetUnitFacingEx(c, a, true)
            call SetUnitAnimationByIndex(c, 5)
            call SetUnitTimeScale(c, 0.9)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 9, 255, 255, 255, PercentTo255(80))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 10 then
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2.5, 4, 102, 178, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        endif
        if count == 110 then
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 4, 102, 178, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        endif
        if count == 210 then
            call CinematicFilterGenericEx(GetOwningPlayer(c), 3, BLEND_MODE_BLEND, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 255, 255, 255, PercentTo255(90), 255, 255, 255, 0)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 255, 255, 255, PercentTo255(90), 255, 255, 255, 0)
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 4, 4, 102, 178, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        endif
        if count <= 330 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.6, 1.85), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 90)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
                call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.75, 1.85), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 90)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            endif
        endif
        if count == 340 then
            call SetUnitAnimationByIndex(c, 7)
            call SetUnitTimeScale(c, 1)
        endif
        if count == 350 then
            call SoundStart("war3mapImported\\Kirin_5-8.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(c), 3.5, BLEND_MODE_BLEND, "war3mapImported\\kirinT.tga", 255, 255, 255, PercentTo255(50), 255, 255, 255, 0)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3.5, BLEND_MODE_BLEND, "war3mapImported\\kirinT.tga", 255, 255, 255, PercentTo255(50), 255, 255, 255, 0)
            call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]az_pafeathermoon_b.mdx", GetUnitX(c), GetUnitY(c), 40, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
            call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        endif
        if count == 360 then
            call SetUnitTimeScale(c, 0)
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 5, 4, 255, 51, 51, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
            loop
                exitwhen i > 17
                set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
                call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(200, 600), randomAngle(), 0, 0, GetRandomReal(5, 7), 3, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
                call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.2)
                set i = i + 1
            endloop
        endif
        if count == 450 then
            call Effect("war3mapimported\\[DoFT]hero_skeletonking_n2s_e_star.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapimported\\BloodEX.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        endif
        if count == 530 then 
            if GetLocalPlayer() == GetOwningPlayer(c) or GetLocalPlayer() == GetOwningPlayer(t) then
                call DisplayCineFilter(false)
            endif
            call SetUnitTimeScale(c, 1)
            call PauseUnit(c, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(c, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(c , t, 15 * GetHeroInt(c , true))
            call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(c, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set c = null
        set t = null
    endfunction
    
    function TodoKirinT_Start takes unit c, unit t returns nothing
        local timer z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function TodoKirinT_End)
        set z = null
    endfunction
    
    function ByakuranR_End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
        local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z) , 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
        local integer i = 0
        local effect e
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        if count <= 440 then
            call PauseUnit(c, true)
            call SetUnitInvulnerable(c, true)
        endif
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
        if count == 1 then 
            call SoundStart("war3mapImported\\Byakuran_4-3.mp3")
            if GetUnitAbilityLevel(c, 'B00Y') > 0 then
                call SetUnitAnimationByIndex(c, 10)
            else
                call SetUnitAnimationByIndex(c, 4)
            endif
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 6, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count <= 350 then 
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.75, 1.65), 1.5, 255, 255, 255, PercentTo255(8))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.55, 0.75))
                if count >= 290 then
                    call Effect("war3mapImported\\SuperShinyThingy.mdx", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                endif
            endif
        endif
        if count == 380 then
            call Effect("war3mapImported\\Shockwave White.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\WhiteDrive.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WhiteXMissile.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 2, 2.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
            call SaveReal(ht, GetHandleId(z), 0, a)
        endif
        if count > 380 and count <= 480 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 2)
            set a = LoadReal(ht, GetHandleId(z), 0)
            set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
            if dist > 140 then
                set x = PolarX(GetEffectX(e), dist / 15, a)
                set y = PolarY(GetEffectY(e), dist / 15, a)
                call SetEffectXY(e, x, y, 1)
            else
                set x = PolarX(GetUnitX(t), 10, a)
                set y = PolarY(GetUnitY(t), 10, a)
                call SetUnitXY(t, x, y, 1)
                set x = PolarX(GetUnitX(t), - 50, a)
                set y = PolarY(GetUnitY(t), - 50, a)
                call SetEffectXY(e, x, y, 1)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\wind3.mdx", GetEffectX(e), GetEffectY(e), 100, a, - 90, 0, GetRandomReal(1, 1.55), 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.35)
                call Effect("war3mapImported\\SuperShinyThingy.mdl", GetEffectX(e), GetEffectY(e), 80, randomAngle(), 0, 0, GetRandomReal(1.25, 1.55), 1, 255, 255, 255, PercentTo255(90))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            endif
        endif
        if count == 440 then
            call SetUnitTimeScale(c, 1)
            call PauseUnit(c, false)
            call SetUnitInvulnerable(c, false)
            call IssueTargetOrderById(c, 851983, t)
        endif
        if count == 480 then
            call Effect("war3mapimported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\ArcaneExplosion_Boss_Base.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.65, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\EarthSlamWhiteSlashes.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapimported\\File00000283.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, 255)
        endif
        if count == 490 then 
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(c , t, ((0.2 * GetUnitBuffLevel(c, 'B00Q')) + (6 + 2 * GetUnitAbilityLevel(c, 'A0AK'))) * GetHeroStr(c, true))
            call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set c = null
        set t = null
        set e = null
    endfunction
    
    function ByakuranR_Start takes unit c, unit t returns nothing
        local timer z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function ByakuranR_End)
        set z = null
    endfunction
    
    function AliceZubergF_End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
        local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z) , 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
        local integer i = 0
        local real randomA
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then 
            call SoundStart("war3mapImported\\Alice_6-1.mp3")
            call SetUnitTimeScale(c, 2)
        endif
        if count == 10 or count == 30 or count == 50 or count == 70 or count == 90 or count == 110 or count == 130 then 
            call ShakeCamera(0.4, GetOwningPlayer(c), 5)
            call ShakeCamera(0.4, GetOwningPlayer(t), 5)
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            set randomA = randomAngle()
            call SetUnitX(c, PolarX(x, 140, randomA))
            call SetUnitY(c, PolarY(y, 140, randomA))
            set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(c, a, true)
            call SetUnitAnimationByIndex(c, GetRandomInt(3, 4))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1, 1, 213, 204, 73, PercentTo255(GetRandomReal(70, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.85))
            call Effect("war3mapImported\\hit-blood-special.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count >= 10 and count <= 130 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 1)
        endif
        if count == 140 or count == 150 or count == 160 or count == 170 or count == 180 then 
            call SetUnitAnimationByIndex(c, GetRandomInt(3, 4))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 213, 204, 73, PercentTo255(GetRandomReal(70, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.85))
            call Effect("war3mapImported\\hit-blood-special.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\effect_alice08.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        endif
        if count >= 140 and count <= 180 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 1)
            set x = PolarX(GetUnitX(t), -120, a)
            set y = PolarY(GetUnitY(t), -120, a)
            call SetUnitXY(c, x, y, 0)
        endif
        if count >= 180 and count <= 220 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 1)
        endif
        if count == 190 then
            call SoundStart("war3mapImported\\Alice_6-2.mp3")
            call ShakeCamera(1, GetOwningPlayer(c), 5)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SetUnitAnimationByIndex(c, 5)
            call SetUnitTimeScale(c, 0.65)
            call Effect("war3mapimported\\effect_alice05.mdx", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 200 and count <= 230 then
            if dist > 140 then
                call SetUnitX(c, PolarX(GetUnitX(c) , dist / 15, a))
                call SetUnitY(c, PolarY(GetUnitY(c) , dist / 15, a))
            else
                call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
                call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                call Effect("war3mapimported\\effect_alice08.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
        endif
        if count == 230 then
            call SoundStart("war3mapImported\\Escanor_3-2.mp3")
            call SetSoundVolume(dummySound, 100)
            call ShakeCamera(1, GetOwningPlayer(c), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapimported\\AliceFSFX1.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\AliceFSFX2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.9, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 240 then 
            call SetUnitTimeScale(c, 1)
            call PauseUnit(c, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(c, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(c , t, 11 * GetHeroAgi(c, true))
            call IssueTargetOrderById(c, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set c = null
        set t = null
    endfunction
    
    function AliceZubergF_Start takes unit c, unit t returns nothing
        local timer z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function AliceZubergF_End)
        set z = null
    endfunction
    
    function BossExtraEnd takes nothing returns nothing
        local timer z = GetExpiredTimer()
        call FlushChildHashtable(ht, StringHash("BossF"))
        call FlushChildHashtable(ht, GetHandleId(z))
        call DestroyTimer(z)
        set z = null
    endfunction
    
    function BossExtra2End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        call FlushChildHashtable(ht, StringHash("BossD"))
        call FlushChildHashtable(ht, GetHandleId(z))
        call DestroyTimer(z)
        set z = null
    endfunction
    
    function bossFEnd takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer i

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ushiwakamaru_7.mp3")
            set x = PolarX(GetUnitX(t), - 500, a)
            set y = PolarY(GetUnitY(t), - 500, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 0.9)
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\az_pafeathermoon_b.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1.5, 255, 255, 255, 255)
        endif
        if count == 1 or count == 15 or count == 30 or count == 45 or count == 60 or count == 75 then
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, 0, 0, 0.8, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        endif
        if count == 15 then
            call Effect("war3mapImported\\az_pa_c-black2.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
        endif
        if count == 20 then
            call Effect("war3mapImported\\[A]hit-white-guangxiao.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 25 then
            call Effect("war3mapImported\\[A]re2.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 30 then
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitFlyHeight(t, 300, 750)
            call Effect("war3mapImported\\[A]redglow.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
        endif
        if count <= 30 then
            set x = PolarX(GetUnitX(u), 35, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 35, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 35 then
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 0.85)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 40 then
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
        endif
        if count == 55 then
            set i = 1
            loop
                exitwhen i > 10
                set x = PolarX(GetUnitX(u), GetRandomReal(- 500, 500), randomAngle())
                set y = PolarY(GetUnitY(u), GetRandomReal(- 500, 500), randomAngle())
                call Effect("war3mapImported\\FCJX_DG.mdl", x, y, GetUnitFlyHeight(t) + GetRandomReal(200, 600), randomAngle(), GetRandomReal(- 140, - 120), 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
                set i = i + 1
            endloop
        endif
        if count == 60 then
            call Effect("war3mapImported\\[A]redglow.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
        endif
        if count >= 40 and count <= 60 then
            set x = PolarX(GetUnitX(u), 45, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 45, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 18, 0)
        endif
        if count == 65 then
            call SetUnitFacingEx(u, a, true)
        endif
        if count == 70 then
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 85 then
            call SoundStart("war3mapImported\\Ushiwakamaru_6-1.mp3")
            call Effect("war3mapImported\\blacksphere.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 100, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 100, randomAngle(), 0, 0, 0.35, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            set x = PolarX(GetUnitX(t), 250, GetUnitFacing(u))
            set y = PolarY(GetUnitY(t), 250, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 90 then
            call Effect("war3mapImported\\dunno1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.25)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.45, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\File00001413.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 95 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, GetUnitMaxLife(t) * 0.3)
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    function bossF takes unit u, unit t returns nothing
        local timer z = CreateTimer()

        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function bossFEnd)

        set z = null
    endfunction

    function bossDEnd takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real randomA

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ushiwakamaru_8.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 1.2)
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\az_pafeathermoon_b.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1.5, 255, 255, 255, 255)
        endif
        if count == 1 or count == 10 or count == 20 or count == 30 or count == 40 then
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.8, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.15, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.55)
        endif
        if count == 40 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 16)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\cyzblueXT.mdl", GetUnitX(u), GetUnitY(u), 200, a, - 40, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 55 or count == 80 or count == 110 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count >= 45 and count <= 145 then
            set x = PolarX(GetUnitX(t), 12, a)
            set y = PolarY(GetUnitY(t), 12, a)
            call SetUnitXY(t, x, y, 1)
            set x = PolarX(GetUnitX(t), - 140, a)
            set y = PolarY(GetUnitY(t), - 140, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator == 2 or iterator == 4 then
                call Effect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                if iterator == 4 then
                    call SaveInteger(ht, GetHandleId(z), 1, 0)
                    set randomA = GetRandomReal(- 30, 30)
                    set x = PolarX(GetUnitX(t), - 140, a + randomA)
                    set y = PolarY(GetUnitY(t), - 140, a + randomA)
                    call SetUnitXY(u, x, y, 0)
                    set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                    call SetUnitFacingEx(u, a, true)
                    if GetRandomInt(1, 2) == 1 then
                        call Effect("war3mapImported\\az_pa_c-black2.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
                        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                    else
                        call Effect("war3mapImported\\az_pa_c-black2.mdl", GetUnitX(t), GetUnitY(t), 50, a + 180, 0, 0, 2, 1, 255, 255, 255, 255)
                        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                    endif
                    call Effect("war3mapImported\\[A]hit-white-guangxiao.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                    call Effect("war3mapImported\\[A]redglow.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                    set x = PolarX(GetUnitX(t), 50, a)
                    set y = PolarY(GetUnitY(t), 50, a)
                    call Effect("war3mapImported\\slash red.mdl", x, y, 150, randomAngle(), GetRandomReal(- 150, - 120), 0, 1.5, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                endif
            endif
        endif
        if count == 145 then
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitFlyHeight(t, 300, 500)
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\DTJJ.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 2, 0, 0, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 175 then
            call SetUnitAnimationByIndex(u, 12)
            call SetUnitTimeScale(u, 1.2)
        endif
        if count == 205 then
            call SoundStart("war3mapImported\\Ushiwakamaru_6-1.mp3")
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\blacksphere.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 100, randomAngle(), 0, 0, 2.75, 1.5, 255, 255, 255, PercentTo255(45))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 0.55, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[Plagiat]Effect77.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 210 then
            call Effect("war3mapImported\\dunno1.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.25)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 0.9, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\zxd5.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 215 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, GetUnitMaxLife(t) * 0.3)
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        
        set z = null
        set u = null
        set t = null
    endfunction

    function bossD takes unit u, unit t returns nothing
        local timer z = CreateTimer()

        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function bossDEnd)

        set z = null
    endfunction
endscope