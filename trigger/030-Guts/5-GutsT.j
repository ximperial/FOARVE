//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_GutsT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Guts_5.mp3")
        call SetUnitAnimationByIndex(c, 12)
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Guts_5-1.mp3")
    endif
    if count == 1 or count == 30 or count == 60 or count == 90 then
        call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        call Effect("war3mapImported\\red-yumao-zhendiLord.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.8, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 1 or count == 100 then
        call Effect("war3mapImported\\bymutou-hongse3.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\red-lizi-zhendi-fast.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
    endif
    if count == 100 then
        call SetUnitAnimationByIndex(c, 11) 
    endif
    if count == 120 or count == 140 or count == 160 or count == 180 then
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        set x = PolarX(GetUnitX(c), - 50, a)
        set y = PolarY(GetUnitY(c), - 50, a)
        call Effect("war3mapImported\\chongfeng2.mdl", x, y, 25, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
    endif
    if count >= 120 and count <= 185 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 40, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 40, a))
        else
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 130 or count == 150 or count == 170 then
        call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7)) 
    endif
    if count == 150 then
        call SetUnitAnimationByIndex(c, 7)
    endif
    if count == 175 then
        call SetUnitAnimationByIndex(c, 8) 
        call SetUnitTimeScale(c, 0.6)
        set x = PolarX(GetUnitX(t), - 250, a)
        set y = PolarY(GetUnitY(t), - 250, a)
        call Effect("war3mapImported\\AZ_PA_C.mdl", x, y, 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
    endif
    if count == 180 then
        call SoundStart("war3mapImported\\Guts_5-2.mp3") 
        call Effect("war3mapImported\\AZ_jingzi_jiansheng01_E1.mdl", GetUnitX(t), GetUnitY(t), 100, a + 40, 0, 0, 1.5, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))  
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.55, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.9, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.25, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
        call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
    endif
    if count == 190 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
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

function Trig_GutsT_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real z1
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist2
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Guts_5-3.mp3")
        call SoundStart("war3mapImported\\Guts_5-4.mp3")
        call SoundStart("war3mapImported\\Guts_5-5.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 1)
        call SetUnitTimeScale(c, 1.5)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
    endif
    if count == 10 then
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
        call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count >= 20 and count <= 40 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
    endif
    if count == 20 or count == 40 or count == 60 or count == 80 then
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        set x = PolarX(GetUnitX(t), - 50, a)
        set y = PolarY(GetUnitY(t), - 50, a)
        call Effect("war3mapImported\\chongfeng2.mdl", x, y, 25, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
    endif
    if count == 30 or count == 50 or count == 70 or count == 90 then
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.35))
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(0.3, 0.5), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(0.8, 1), 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7)) 
    endif
    if count >= 40 and count <= 100 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
    endif
    if count == 40 then
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(c))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(c))
    endif
    if count >= 40 and count <= 110 then 
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), 8 + dist / 20, a))
            call SetUnitY(c, PolarY(GetUnitY(c), 8 + dist / 20, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        set x = LoadReal(ht, GetHandleId(z), 0)
        set y = LoadReal(ht, GetHandleId(z), 1)
        set x1 = PolarX(GetUnitX(t), - 120, a)
        set y1 = PolarY(GetUnitY(t), - 120, a)
        set dist = Distance(x, y, x1, y1)
        set dist2 = Distance(x, y, GetUnitX(c), GetUnitY(c))
        set z1 = GetParabolaZEx(dist2, dist, 400, 0, 50)
        call SetUnitFlyHeight(c, z1, 0)
    endif
    if count == 40 then
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 0.7)
    endif
    if count == 50 or count == 70 or count == 90 then
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        set x = PolarX(GetUnitX(c), - 50, a)
        set y = PolarY(GetUnitY(c), - 50, a)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
    endif
    if count == 60 or count == 80 or count == 100 then
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
    endif
    if count == 110 then
        set x = PolarX(GetUnitX(t), - 150, a)
        set y = PolarY(GetUnitY(t), - 150, a)
        call Effect("war3mapImported\\animeslashfinal.mdl", x, y, 150, a, 0, - 270, 2.5, 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 120 then
        call SoundStart("war3mapImported\\Guts_5-6.mp3")
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 190 then
        call SoundStart("war3mapImported\\Guts_5-7.mp3")
        call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\blood-rou.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.7, 1, PercentTo255(40), PercentTo255(40), PercentTo255(40), PercentTo255(40)) 
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)    
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
    endif
    if count == 200 then 
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 17 * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
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

function Trig_GutsT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0B6' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if GetUnitTypeId(c) == 'H0FT' then
            call TimerStart(z, 0.02, true, function Trig_GutsT_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_GutsT_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_GutsT takes nothing returns nothing
    set gg_trg_GutsT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GutsT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GutsT, function Trig_GutsT_Actions )
endfunction