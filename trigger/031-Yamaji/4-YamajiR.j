//TESH.scrollpos=362
//TESH.alwaysfold=0
function Trig_YamajiR_Func001 takes nothing returns nothing
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
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Yamaji_4.mp3")
        call SoundStart("war3mapImported\\Yamaji_4-1.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 0.3, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(80), PercentTo255(50), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
    endif
    if count == 1 or count == 15 or count == 30 then
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.35), 1, 255, PercentTo255(80), PercentTo255(50), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
    endif
    if count == 80 then
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 0.7)
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Yamaji_4-2.mp3")
    endif
    if count >= 100 and count <= 300 then 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 10 or iterator == 20 then 
            if iterator == 20 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
            endif
            set x = PolarX(GetUnitX(t), GetRandomReal(- 700, 700), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 700, 700), randomAngle())
            call Effect("war3mapImported\\EscanorCruelSunExpAfb.mdl", x, y, 25, randomAngle(), 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", x, y, 100, randomAngle(), 0, 0, 1.3, 1, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
    endif
    if count == 330 or count == 350 or count == 370 then
        call Effect("war3mapImported\\EscanorCruelSunExpAfb1.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, PercentTo255(80), PercentTo255(50), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 370 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0BD')) * GetHeroStr(c, true))
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

function Trig_YamajiR_Func002 takes nothing returns nothing
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
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Yamaji_4-7.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 0.4, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
    endif
    if count == 1 or count == 30 or count == 60 or count == 90 then
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1.15, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(80), PercentTo255(50), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 50 then
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count >= 50 and count <= 100 then
        set x = PolarX(GetUnitX(c), 4, a)
        set y = PolarY(GetUnitY(c), 4, a)
        call SetUnitX(c, x)
        call SetUnitY(c, y)
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Yamaji_4-8.mp3")
        call SoundStart("war3mapImported\\Yamaji_4-9.mp3")
        call SetUnitAnimationByIndex(c, 1)
        call SetUnitTimeScale(c, 0.5)
    endif
    if count == 110 then 
        call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\Genryuusai_onearmed.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a))
        call SetUnitFacing(c, a + 180)
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count == 115 then
        set x = PolarX(GetUnitX(t), - 200, a)
        set y = PolarY(GetUnitY(t), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 150, a, - 180, 0, 1.75, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 150, a, - 180, 0, 1.4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 120 then
        set x = PolarX(GetUnitX(t), - 200, a)
        set y = PolarY(GetUnitY(t), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 150, a - 30, - 180, 0, 1.75, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 150, a - 30, - 180, 0, 1.4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count >= 120 and count <= 160 then
        set x = PolarX(GetUnitX(t), 15, a)
        set y = PolarY(GetUnitY(t), 15, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)  
        endif
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Yamaji_4-10.mp3")
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitX(c, PolarX(GetUnitX(t), 300, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 300, a)) 
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacing(c, a)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 200 or count == 220 or count == 240 then
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapImported\\chongfeng2.mdl", x, y, 50, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 25, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(c), 20, a)
        set y = PolarY(GetUnitY(c), 20, a)
        call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count >= 200 and count <= 230 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetUnitX(c), 20, a)
        set y = PolarY(GetUnitY(c), 20, a)
        call SetUnitX(c, x)
        call SetUnitY(c, y)
    endif
    if count == 215 then
        call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count >= 220 and count <= 265 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(c), 50, a)
            set y = PolarY(GetUnitY(c), 50, a)
            call Effect("war3mapImported\\[A]SlamWithOut.mdl", x, y, 50, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 230 and count == 290 then
        call SetUnitAnimationByIndex(c, 6)
    endif
    if count >= 230 and count <= 270 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetUnitX(c), 12, a)
        set y = PolarY(GetUnitY(c), 12, a)
        call SetUnitX(c, x)
        call SetUnitY(c, y)
    endif
    if count == 270 then
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SoundStart("war3mapImported\\Yamaji_4-11.mp3")
        call SetUnitFacing(c, a)
    endif
    if count == 260 or count == 290 or count == 310 or count == 330 then
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapImported\\chongfeng2.mdl", x, y, 50, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        set x = PolarX(GetUnitX(c), - 150, a)
        set y = PolarY(GetUnitY(c), - 150, a)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 25, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(c), 20, a)
        set y = PolarY(GetUnitY(c), 20, a)
        call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 300 then
        call SetUnitTimeScale(c, 0.5)
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count >= 290 and count <= 340 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 40, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 40, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a)) 
        endif
    endif
    if count == 330 then
        set x = PolarX(GetUnitX(t), - 300, a)
        set y = PolarY(GetUnitY(t), - 300, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 3, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 334 then
        set x = PolarX(GetUnitX(t), - 300, a)
        set y = PolarY(GetUnitY(t), - 300, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 3, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 338 then
        call SoundStart("war3mapImported\\Yamaji_4-12.mp3") 
        set x = PolarX(GetUnitX(t), - 300, a)
        set y = PolarY(GetUnitY(t), - 300, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 3, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 4, 1, 255, PercentTo255(70), 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 342 then
        set x = PolarX(GetUnitX(t), - 300, a)
        set y = PolarY(GetUnitY(t), - 300, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 3, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 350 then
        call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)  
        call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 4, 1.5, 255, PercentTo255(70), 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)  
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 360 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 14 * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_YamajiR_Func003 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    if not IsUnitInvulnerable(c) then
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
    endif
    if count >= 250 or not IsUnitAlive(c) or GetUnitAbilityLevel(c, 'B00J') == 0 then
        call UnitRemoveAbility(c, 'A0BE')
        call UnitRemoveAbility(c, 'B00J')
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_YamajiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0BD' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if t != c then
            call PauseUnit(c, true)
            call SetUnitInvulnerable(c, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            if GetUnitTypeId(c) == 'H0FV' then
                call TimerStart(z, 0.02, true, function Trig_YamajiR_Func002)
            else
                call TimerStart(z, 0.02, true, function Trig_YamajiR_Func001)
            endif
        else
            call SoundStart("war3mapImported\\Yamaji_4-3.mp3")
            call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
            call UnitAddAbility(c, 'A0BE')
            call UnitMakeAbilityPermanent(c, true, 'A0BE')
            call TimerStart(z, 0.02, true, function Trig_YamajiR_Func003)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_YamajiR takes nothing returns nothing
    set gg_trg_YamajiR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_YamajiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_YamajiR, function Trig_YamajiR_Actions )
endfunction