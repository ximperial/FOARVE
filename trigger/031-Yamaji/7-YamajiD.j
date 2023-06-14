//TESH.scrollpos=114
//TESH.alwaysfold=0
function Trig_YamajiD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Yamaji_7.mp3")
        if GetUnitTypeId(c) == 'H0FV' then
            call SetUnitAnimationByIndex(c, 0)
        else 
            call SetUnitAnimationByIndex(c, 1)
        endif
        call SetUnitTimeScale(c, 0.5)
    endif
    if count == 1 or count == 30 or count == 60 or count == 90 or count == 120 or count == 150 then
        call Effect("war3mapImported\\[A]Explodeorange.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(80), PercentTo255(50), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Yamaji_7-1.mp3")
        if GetUnitTypeId(c) == 'H0FV' then
            call SetUnitAnimationByIndex(c, 8)
        else 
            call SetUnitAnimationByIndex(c, 2)
        endif
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Yamaji_7-2.mp3")
        call SetUnitTimeScale(c, 0.7)
    endif
    if count == 150 and count == 160 or count == 170 or count == 180 or count == 190 then 
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapImported\\CF2.mdl", x, y, 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count >= 150 and count <= 170 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 170 then
        if GetUnitTypeId(c) == 'H0FV' then
            call SetUnitAnimationByIndex(c, 7)
            call SetUnitTimeScale(c, 0.9)  
        else
            call SetUnitAnimationByIndex(c, 3)
            call SetUnitTimeScale(c, 1) 
        endif
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
    endif
    if count >= 170 and count <= 230 then
        set x = PolarX(GetUnitX(c), 7, GetUnitFacing(c))
        set y = PolarY(GetUnitY(c), 7, GetUnitFacing(c))
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y) 
        endif
    endif
    if count == 195 then
        if GetUnitTypeId(c) == 'H0FV' then
            set x = PolarX(GetUnitX(t), - 100, GetUnitFacing(c))
            set y = PolarY(GetUnitY(t), - 100, GetUnitFacing(c))
            call Effect("war3mapImported\\animeslashfinal.mdl", x, y, 100, GetUnitFacing(c), 0, - 270, 2, 1, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)  
            call Effect("war3mapImported\\[A]HibikiSlam.mdl", x, y, 100, GetUnitFacing(c), 0, 0, 1.5, 1, 255, PercentTo255(80), PercentTo255(50), PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, GetUnitFacing(c), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, GetUnitFacing(c), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            set x = PolarX(GetUnitX(t), 50, GetUnitFacing(c))
            set y = PolarY(GetUnitY(t), 50, GetUnitFacing(c))
            call Effect("war3mapImported\\az_hit-red-blade.mdl", x, y, 100, GetUnitFacing(c), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        else
            set x = PolarX(GetUnitX(t), - 200, GetUnitFacing(c))
            set y = PolarY(GetUnitY(t), - 200, GetUnitFacing(c))
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, GetUnitFacing(c), 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, GetUnitFacing(c), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, GetUnitFacing(c), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
    endif
    if count == 205 then
        call SoundStart("war3mapImported\\Yamaji_7-3.mp3")
    endif
    if count == 220 then
        call SetUnitFacing(c, a)
    endif
    if count == 230 then
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 150, a + 180, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 150, a + 180, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        set x = PolarX(GetUnitX(t), 50, a+180)
        set y = PolarY(GetUnitY(t), 50, a+180)
        call Effect("war3mapImported\\az_hit-red-blade.mdl", x, y, 100, a + 180, 0, 0, 3.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapImported\\AZ_Jugg_E1.mdl", GetUnitX(t), GetUnitY(t), 100, a + 210, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\AZ_Jugg_E1.mdl", GetUnitX(t), GetUnitY(t), 100, a + 150, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 240 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        if GetUnitTypeId(c) == 'H0FV' then
            call DamageUnit(c, t, 10 * GetHeroStr(c, true))
        else
            call DamageUnit(c, t, 8 * GetHeroStr(c, true))
        endif
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

function Trig_YamajiD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0BH' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_YamajiD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_YamajiD takes nothing returns nothing
    set gg_trg_YamajiD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_YamajiD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_YamajiD, function Trig_YamajiD_Actions )
endfunction