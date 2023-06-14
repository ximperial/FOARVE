//TESH.scrollpos=165
//TESH.alwaysfold=0
function Trig_GutsR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Guts_4.mp3")
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 0.25)
        call Effect("war3mapImported\\blue-guagnzhu-special.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count == 1 or count == 30 then
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count >= 40 and count <= 70 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a))
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
    if count == 50 then
        call SetUnitAnimationByIndex(c, 7)
    endif
    if count == 50 or count == 70 or count == 110 or count == 130 or count == 180 or count == 190 or count == 210 then
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count == 60 then
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitTimeScale(c, 0.5)
    endif
    if count == 65 then
        set x = PolarX(GetUnitX(t), - 175, a)
        set y = PolarY(GetUnitY(t), - 175, a)
        call Effect("war3mapImported\\File00000827.mdl", x, y, 25, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Guts_4-1.mp3")
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\hero_dwarvensniper_n3s_o_target.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 70 or count == 220 then
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.35, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
    endif
    if count >= 70 and count <= 150 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetUnitX(c), 10, a)
        set y = PolarY(GetUnitY(c), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
    endif
    if count == 150 then
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitTimeScale(c, 2)
        call SetUnitFacing(c, a)
    endif
    if count == 180 then
        call SetUnitTimeScale(c, 0.5)
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count >= 180 and count <= 230 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 30, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 30, a))
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
    if count == 200 then
        call SetUnitTimeScale(c, 0.75) 
    endif
    if count == 220 then
        set x = PolarX(GetUnitX(t), - 220, a)
        set y = PolarY(GetUnitY(t), - 220, a)
        call Effect("war3mapImported\\az_pa_c33.mdl", x, y, 100, a, 0, 0, 2.2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
    endif
    if count == 230 then
        call Effect("war3mapImported\\hero_dwarvensniper_n3s_o_target.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7) 
        call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3) 
        call Effect("war3mapImported\\blue-slash-more.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 0.75, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
    endif
    if count == 240 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0B5')) * GetHeroStr(c, true))
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

function Trig_GutsR_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x0
    local real y0
    local real x
    local real y
    local real z1
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist2
    local integer i = 0
    local real pitch
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
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
        call SoundStart("war3mapImported\\Guts_4-2.mp3")
        call SetUnitAnimationByIndex(c, 1)
        call SetUnitTimeScale(c, 0.55)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
    endif
    if count == 1 or count == 20 or count == 40 or count == 70 or count == 90 then
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
    if count == 40 then
        set x = PolarX(GetUnitX(t), - 100, a)
        set y = PolarY(GetUnitY(t), - 100, a)
        call Effect("war3mapImported\\animeslashfinal.mdl", x, y, 150, a, 0, - 270, 2.25, 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count <= 50 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 40, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 40, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        if count > 30 then 
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 15, 0)
        else 
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 10, 0)
        endif
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Guts_4-3.mp3") 
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count >= 50 and count <= 100 then
        set x = PolarX(GetUnitX(t), 12, a)
        set y = PolarY(GetUnitY(t), 12, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 12, 0)
    endif
    if count == 100 then
        call SetUnitFlyHeight(c, 3000, 0)
        set x = PolarX(GetUnitX(t), - 600, a)
        set y = PolarY(GetUnitY(t), - 600, a)
        set pitch = Slope(x, y, 0, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\gutsberserk.mdl", x, y, 0, a, pitch, 0, 1, 0.8, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        set pitch = Slope(GetEffectX(e), GetEffectY(e), GetEffectZ(e), GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetEffectX(e), GetEffectY(e), 25, a, pitch, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8)) 
        call Effect("war3mapImported\\CF2.mdl", GetEffectX(e), GetEffectY(e), 25, a, pitch, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
        set x = PolarX(GetEffectX(e), - 50, GetSpecialEffectYaw(e))
        set y = PolarY(GetEffectY(e), - 50, GetSpecialEffectYaw(e))
        call Effect("war3mapImported\\chongfeng2.mdl", x, y, 25, a, pitch, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\wind3.mdl", GetEffectX(e), GetEffectY(e), 50, a, pitch, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
    endif
    if count == 120 then
        call SoundStart("war3mapImported\\Guts_4-4.mp3")
    endif
    if count == 130 or count == 160 or count == 190 then
        set x = PolarX(GetUnitX(t), 600, randomAngle())
        set y = PolarY(GetUnitY(t), 600, randomAngle())
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        set pitch = Slope(x, y, 0, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\gutsberserk.mdl", x, y, 0, a, pitch, 0, 1, 0.8, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        set pitch = Slope(GetEffectX(e), GetEffectY(e), GetEffectZ(e), GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetEffectX(e), GetEffectY(e), 25, a, pitch, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8)) 
        call Effect("war3mapImported\\CF2.mdl", GetEffectX(e), GetEffectY(e), 25, a, pitch, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
        set x = PolarX(GetEffectX(e), - 50, GetSpecialEffectYaw(e))
        set y = PolarY(GetEffectY(e), - 50, GetSpecialEffectYaw(e))
        call Effect("war3mapImported\\chongfeng2.mdl", x, y, 25, a, pitch, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\wind3.mdl", GetEffectX(e), GetEffectY(e), 50, a, pitch, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
    endif
    if count == 220 or count == 250 or count == 280 then
        set x = PolarX(GetUnitX(t), 600, randomAngle())
        set y = PolarY(GetUnitY(t), 600, randomAngle())
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        set pitch = Slope(x, y, 800, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\gutsberserk.mdl", x, y, 800, a, pitch, 0, 1, 0.8, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        set pitch = Slope(GetEffectX(e), GetEffectY(e), GetEffectZ(e), GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetEffectX(e), GetEffectY(e), 800, a, pitch, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8)) 
        call Effect("war3mapImported\\CF2.mdl", GetEffectX(e), GetEffectY(e), 800, a, pitch, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
        set x = PolarX(GetEffectX(e), - 50, GetSpecialEffectYaw(e))
        set y = PolarY(GetEffectY(e), - 50, GetSpecialEffectYaw(e))
        call Effect("war3mapImported\\chongfeng2.mdl", x, y, 800, a, pitch, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\wind3.mdl", GetEffectX(e), GetEffectY(e), 800, a, pitch, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
    endif
    if count >= 100 and count <= 130 or count >= 130 and count <= 160 or count >= 160 and count <= 190 or count >= 190 and count <= 220 then
        set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
        call SetEffectX(e, PolarX(GetEffectX(e), 30, GetSpecialEffectYaw(e)))
        call SetEffectY(e, PolarY(GetEffectY(e), 30, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, z1 + 30)
    endif
    if count >= 220 and count <= 250 or count >= 250 and count <= 280 or count >= 280 or count <= 310 then
        set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
        call SetEffectX(e, PolarX(GetEffectX(e), 30, GetSpecialEffectYaw(e)))
        call SetEffectY(e, PolarY(GetEffectY(e), 30, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, z1 - 20)
    endif
    if count == 110 or count == 140 or count == 170 or count == 200 or count == 230 or count == 260 or count == 290 then
        if GetRandomInt(1, 2) == 1 then 
            call SetSpecialEffectAnimationByIndex(e, 1)
        else
            call SetSpecialEffectAnimationByIndex(e, 2)
        endif 
    endif
    if count == 120 or count == 150 or count == 180 or count == 210 then
        set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        set x = PolarX(GetUnitX(t), - 300, a)
        set y = PolarY(GetUnitY(t), - 300, a)
        set pitch = Slope(x, y, GetUnitFlyHeight(t) - 50, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\az_pa_c-black.mdl", x, y, GetUnitFlyHeight(t) - 50, a, pitch, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 2.6, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\[A]wavejojo.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), pitch, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
        call Effect("war3mapImported\\[A]wavejojo.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), pitch, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
    endif
    if count == 240 or count == 270 or count == 300 then
        set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        set x = PolarX(GetUnitX(t), - 300, a)
        set y = PolarY(GetUnitY(t), - 300, a)
        set pitch = Slope(x, y, GetUnitFlyHeight(t) + 50, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\az_pa_c-black.mdl", x, y, GetUnitFlyHeight(t) + 50, a, pitch, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 2.6, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\[A]wavejojo.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), pitch, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
        call Effect("war3mapImported\\[A]wavejojo.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), pitch, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
    endif
    if count == 310 then
        set x = PolarX(GetUnitX(t), 600, randomAngle())
        set y = PolarY(GetUnitY(t), 600, randomAngle())
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\gutsberserk.mdl", x, y, 0, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
    endif
    if count == 320 then
        call SoundStart("war3mapImported\\Guts_4-5.mp3") 
    endif
    if count >= 310 and count <= 350 then
        set x0 = LoadReal(ht, GetHandleId(z), 0)
        set y0 = LoadReal(ht, GetHandleId(z), 1)
        set dist = Distance(x0, y0, GetUnitX(t), GetUnitY(t))
        set a = Angle(GetEffectX(e2), GetEffectY(e2), GetUnitX(t), GetUnitY(t))
        set x = PolarX(GetEffectX(e2), dist / 40, a)
        set y = PolarY(GetEffectY(e2), dist / 40, a)
        set dist2 = Distance(x0, y0, GetEffectX(e2), GetEffectY(e2))
        set z1 = GetParabolaZEx(dist2, dist, 400, 0, GetUnitFlyHeight(t) + 50)
        call SetEffectX(e2, x)
        call SetEffectY(e2, y)
        call SetSpecialEffectZ(e2, z1 + GetAxisZ(GetEffectX(e2), GetEffectY(e2)))
    endif
    if count == 350 then
        set x = PolarX(GetUnitX(t), - 100, a)
        set y = PolarY(GetUnitY(t), - 100, a) 
        call Effect("war3mapImported\\AZ_jingzi_jiansheng01_E1.mdl", x, y, GetUnitFlyHeight(t), a, - 90, 0, 1, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 1.2, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))  
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 1.55, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 0.9, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 1.25, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
        call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count >= 360 and count <= 370 then
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 60, 0)
        call SetSpecialEffectZ(e2, GetEffectZ(e2) - 60)
    endif
    if count == 370 then
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)  
    endif
    if count == 380 then 
        call SetUnitX(c, GetEffectX(e2))
        call SetUnitY(c, GetEffectY(e2)) 
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 14 * GetHeroStr(c, true))
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
    set e = null
    set e2 = null
endfunction

function Trig_GutsR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0B5' then 
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
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function Trig_GutsR_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_GutsR_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_GutsR takes nothing returns nothing
    set gg_trg_GutsR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GutsR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GutsR, function Trig_GutsR_Actions )
endfunction