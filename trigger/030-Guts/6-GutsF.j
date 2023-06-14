//TESH.scrollpos=78
//TESH.alwaysfold=0
globals
    integer GutsF2Hash = StringHash("GutsF2")
endglobals

function Trig_GutsF_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 115 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Guts_6.mp3")
        call SetUnitAnimationByIndex(c, 11)
        call SetUnitTimeScale(c, 0.8)
    endif
    if count == 1 or count == 30 then
        call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
    endif
    if count == 40 or count == 50 or count == 60 then
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 25, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
    endif
    if count >= 40 and count <= 70 then
        set x = PolarX(GetUnitX(c), - 15, a)
        set y = PolarY(GetUnitY(c), - 15, a) 
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Guts_6-1.mp3") 
        call SetUnitAnimationByIndex(c, 12)
        call Effect("war3mapImported\\ArrowSqwirl.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 70 or count == 90 then
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.55, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.35, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        set x = PolarX(GetUnitX(c), - 150, a)
        set y = PolarY(GetUnitY(c), - 150, a)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 25, a, 0, 0, 0.75, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count >= 70 and count <= 110 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 30, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 30, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif 
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call SetEffectX(e, GetUnitX(c))
        call SetEffectY(e, GetUnitY(c))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)) + 25)
        call SetSpecialEffectYaw(e, a)
    endif
    if count == 110 then
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\ChuShou_Effect_Earth1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
    endif
    if count == 115 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call StartAbilityCooldown(GetUnitAbility(c, 'A0B7'), 0)
        call SetAbilityCastTime(GetUnitAbility(c, 'A0B7'), 0.01)
    endif
    if count == 270 or (count > 115 and not LoadBoolean(ht, GutsF2Hash, GetHandleId(c))) then
        if LoadBoolean(ht, GutsF2Hash, GetHandleId(c)) then
            call SaveBoolean(ht, GutsF2Hash, GetHandleId(c), false)
            call StartAbilityCooldown(GetUnitAbility(c, 'A0B7'), 80)
        endif
        call SetAbilityCastTime(GetUnitAbility(c, 'A0B7'), 0.35)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_GutsF_Func002 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Guts_6-2.mp3")
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.75)
    endif
    if count == 10 or count == 30 or count == 50 or count == 70 or count == 90 or count == 110 or count == 130 then
        call SetUnitX(c, PolarX(GetUnitX(t), 120, randomAngle()))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, randomAngle()))
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        if GetRandomInt(1, 2) == 1 then
            call SetUnitAnimationByIndex(c, 1)
        else
            call SetUnitAnimationByIndex(c, 2) 
        endif
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
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
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 130 then
        call SoundStart("war3mapImported\\Guts_6-3.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 2)
    endif
    if count == 130 or count == 145 or count == 160 or count == 175 or count == 190 or count == 205 or count == 220 or count == 235 or count == 250 or count == 270 then
        call SetUnitX(c, PolarX(GetUnitX(t), 120, randomAngle()))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, randomAngle()))
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        if GetRandomInt(1, 2) == 1 then
            call SetUnitAnimationByIndex(c, 1)
        else
            call SetUnitAnimationByIndex(c, 2) 
        endif
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count >= 130 and count <= 270 then 
        set x = PolarX(GetUnitX(t), 15, a)
        set y = PolarY(GetUnitY(t), 15, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif 
    endif
    if count == 270 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 6 * GetHeroStr(c, true))
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

function Trig_GutsF_Func003 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Guts_6-4.mp3")
        call SetUnitAnimationByIndex(c, 11)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call Effect("war3mapImported\\bymutou-hongse3.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count == 1 or count == 50 then
        call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.7, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
    endif
    if count == 50 then
        call SetUnitAnimationByIndex(c, 5) 
        call SetUnitTimeScale(c, 0.5)
    endif
    if count == 50 and count == 70 or count == 90 or count == 110 then
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
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
    if count >= 50 and count <= 130 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 60, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 60, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        if count > 100 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 20, 0)
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 12, 0)
        endif
    endif
    if count == 120 then
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a) 
        call Effect("war3mapImported\\[A]SlashCirlce.mdl", x, y, 50, a, - 90, 0, 0.65, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 130 then
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, PercentTo255(10), 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3) 
        call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 130 or count == 150 or count == 170 or count == 190 then
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
    endif
    if count >= 130 and count <= 200 then
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a)) 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 5 or iterator == 10 then 
            if iterator == 10 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(t), 30, a)
                set y = PolarY(GetUnitY(t), 30, a)
                call Effect("war3mapImported\\qqqqqr.mdl", x, y, 25, a, 0, 0, GetRandomReal(1.25, 1.5), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
            endif
            set x = PolarX(GetUnitX(t), 30, a)
            set y = PolarY(GetUnitY(t), 30, a)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", x, y, 25, a, 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
            call Effect("war3mapImported\\az-zidan.mdl", x, y, 100, a, 0, 0, GetRandomReal(1.25, 1.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
        endif
    endif
    if count == 200 then
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, PercentTo255(10), 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3) 
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[A]Sand3.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
    endif
    if count == 210 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 13 * GetHeroStr(c, true))
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

function Trig_GutsF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0B7' then 
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
            call TimerStart(z, 0.02, true, function Trig_GutsF_Func003)
        else
            if not LoadBoolean(ht, GutsF2Hash, GetHandleId(c)) then
                call SaveBoolean(ht, GutsF2Hash, GetHandleId(c), true)
                call TimerStart(z, 0.02, true, function Trig_GutsF_Func001)
            else
                call SaveBoolean(ht, GutsF2Hash, GetHandleId(c), false)
                call TimerStart(z, 0.02, true, function Trig_GutsF_Func002)
            endif
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_GutsF takes nothing returns nothing
    set gg_trg_GutsF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GutsF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GutsF, function Trig_GutsF_Actions )
endfunction